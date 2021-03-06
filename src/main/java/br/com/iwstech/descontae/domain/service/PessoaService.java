package br.com.iwstech.descontae.domain.service;

import static org.springframework.data.domain.ExampleMatcher.matching;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.stereotype.Service;

import br.com.iwstech.descontae.domain.model.Assinatura;
import br.com.iwstech.descontae.domain.model.Cartao;
import br.com.iwstech.descontae.domain.model.Pessoa;
import br.com.iwstech.descontae.domain.model.Telefone;
import br.com.iwstech.descontae.infraestructure.persistence.jpa.PessoaRepository;
import br.com.iwstech.descontae.infraestructure.persistence.jpa.TelefoneRepository;
import br.com.iwstech.descontae.infraestructure.persistence.jpa.TipoPessoaRepository;
import br.com.iwstech.util.infraestructure.dto.Token;
import br.com.iwstech.util.infraestructure.exception.NegocioException;
import br.com.iwstech.util.infraestructure.security.PasswordGenerator;
import br.com.iwstech.util.infraestructure.service.KeycloakService;
import br.com.iwstech.util.infraestructure.service.RestFullService;

@Service
public class PessoaService extends RestFullService<Pessoa, Long> {

    @Autowired
    private EnderecoService enderecoService;

    @Autowired
    private KeycloakService keycloakService;

    @Autowired
    private CartaoService cartaoService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private TipoPessoaRepository tpRepo;

    @Autowired
    private TelefoneRepository telRepo;

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

    public Pessoa findByCPF(String cpf) throws NegocioException {

        Pessoa pessoa = new Pessoa();
        pessoa.setCpf(cpf);
        pessoa = getRepository().findOne(Example.of(pessoa));

        return pessoa;
    }

    @Override
    public Pessoa add(Pessoa e) throws NegocioException {

        Pessoa p = findByEmail(e.getEmail());
        if(p != null) {
            throw new NegocioException("email-ja-registrado");
        }

        p = findByCPF(e.getCpf());
        if(p != null) {
            throw new NegocioException("cpf-ja-registrado");
        }

        return super.add(e);

    }

    @Override
    protected Pessoa save(Pessoa e) throws NegocioException {

        boolean novo = (e.getId() == null);
        Date agora = new Date(System.currentTimeMillis());

        try {
            e.setTipoPessoa(tpRepo.findOne(e.getTipoPessoa().getId()));

            e.setDataAlteracao(agora);
            if(e.getEndereco() != null && e.getEndereco().getCep() != null)  {
                e.setEndereco(enderecoService.addOrUpdate(e.getEndereco()));
            } else {
                e.setEndereco(null);
            }

            if(novo) {
                e.setDataCadastro(agora);
                e.setIdioma(e.getIdioma() != null ? e.getIdioma() : "pt-BR");
                keycloakService.createUser(e.getNome(), null, e.getEmail(), e.getSenha());
            }

            List<Telefone> ts = new ArrayList<>();

            if(e.getTelefones() != null) {
                ts.addAll(e.getTelefones());
                e.getTelefones().clear();
            }

            Pessoa saida = repository.save(e);

            for(Telefone t : ts) {
                Telefone nt = new Telefone();
                nt.setPessoa(saida);
                nt.setNumero(t.getNumero());
                telRepo.save(nt);
            }

            return saida;

        } catch(Exception ex) {
            throw new NegocioException(ex.getMessage(), ex);
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

    public void alterarSenha(Token token) throws NegocioException {

        try {

            Pessoa p = findByEmail(token.getUsername());
            if(p != null) {
                throw new NegocioException("email-nao-encontrado");
            }

            String novaSenha = PasswordGenerator.generate(8);
            keycloakService.defineUserPassword(token.getUserId(), novaSenha);
            emailService.enviarAlteracaoSenha(token.getName(), token.getUsername(), novaSenha);

        } catch(Exception ex) {
            throw new NegocioException(ex.getMessage(), ex);
        }

    }
}
