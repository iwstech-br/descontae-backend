package br.com.ertic.descontae.domain.service;

import static org.springframework.data.domain.ExampleMatcher.matching;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.stereotype.Service;

import br.com.ertic.descontae.domain.model.Assinatura;
import br.com.ertic.descontae.domain.model.Cartao;
import br.com.ertic.descontae.domain.model.Pessoa;
import br.com.ertic.descontae.infraestructure.persistence.jpa.PessoaRepository;
import br.com.ertic.util.infraestructure.exception.NegocioException;
import br.com.ertic.util.infraestructure.service.KeycloakService;
import br.com.ertic.util.infraestructure.service.RestFullService;

@Service
public class PessoaService extends RestFullService<Pessoa, Long> {

    @Autowired
    private EnderecoService enderecoService;

    @Autowired
    private KeycloakService keycloakService;

    @Autowired
    private CartaoService cartaoService;

    @Autowired
    PessoaService(PessoaRepository repository) {
        super(repository);
    }

    public Pessoa findByEmail(String email) throws NegocioException {

        Pessoa pessoa = new Pessoa();
        pessoa.setEmail(email);
        ExampleMatcher em = matching();
        em = matching().withMatcher("email", matcher -> matcher.ignoreCase());
        pessoa = getRepository().findOne(Example.of(pessoa, em));

        if(pessoa != null) {
            Cartao c = cartaoService.findAtivoPorUsuario(email);
            pessoa.setCartaoAtivo(c != null);
        }

        return pessoa;
    }

    @Override
    protected Pessoa save(Pessoa e) throws NegocioException {

        Pessoa p = findByEmail(e.getEmail());
        if(p != null) {
            throw new NegocioException("email-ja-registrado");
        }

        boolean novo = (e.getId() == null);
        if(novo) {
            e.setDataCadastro(new Date(System.currentTimeMillis()));
            e.setIdioma(e.getIdioma() != null ? e.getIdioma() : "pt-BR");
        }

        if(e.getEndereco() != null && e.getEndereco().getCep() != null)  {
            e.setEndereco(enderecoService.addOrUpdate(e.getEndereco()));
        } else {
            e.setEndereco(null);
        }

        e.setDataAlteracao(e.getDataCadastro());

        try {
            p = repository.save(e);

            if(novo) {
                keycloakService.createUser(e.getNome(), null, e.getEmail(), e.getSenha());
            }

            return p;

        } catch(Exception ex) {
            throw new NegocioException("erro-salvar-pessoa", ex);
        }

    }

    public boolean verificar(String cpf, String email) {
        Long total = 0L;
        if(cpf != null) {
            total += ((PessoaRepository)repository).verificarCPFDuplicado(cpf);
        }

        if(email != null) {
            total += ((PessoaRepository)repository).verificarEmailDuplicado(email);
        }

        return total > 0;
    }

    public Assinatura findAssinaturaVigente(String email) throws NegocioException {
        return ((PessoaRepository)repository).findAssinaturaVigente(email);
    }

}
