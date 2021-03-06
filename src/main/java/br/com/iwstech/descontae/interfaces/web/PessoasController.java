package br.com.iwstech.descontae.interfaces.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import br.com.iwstech.descontae.Application;
import br.com.iwstech.descontae.domain.model.Pessoa;
import br.com.iwstech.descontae.domain.service.ConsumoService;
import br.com.iwstech.descontae.domain.service.PessoaService;
import br.com.iwstech.descontae.interfaces.web.dto.ConsumoUsuarioDTO;
import br.com.iwstech.util.infraestructure.dto.Token;
import br.com.iwstech.util.infraestructure.exception.NegocioException;
import br.com.iwstech.util.infraestructure.log.Log;
import br.com.iwstech.util.infraestructure.web.RestFullEndpoint;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/api/pessoas")
public class PessoasController extends RestFullEndpoint<Pessoa, Long> {

    @Autowired
    private Token token;

    @Autowired
    private ConsumoService consumoService;

    @Autowired
    public PessoasController(PessoaService service) {
        super(service);
    }

    @RequestMapping(method = RequestMethod.GET, path="/login")
    public ResponseEntity<?> getByEmail(
        @RequestParam(name="email", required=true) String email) {
        try {
            Pessoa p = ((PessoaService)service).findByEmail(email);

            if(p != null) {
                return new ResponseEntity<>(p, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }

        } catch (Exception ex) {
            Log.error(this.getClass(), ex);
            return new ResponseEntity<>(ex.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(method = RequestMethod.GET, path="/verificar")
    public ResponseEntity<Pessoa> verificar(
        @RequestParam(name="email", required=false) String email,
        @RequestParam(name="cpf", required=false) String cpf) {

        if(cpf == null && email == null) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        boolean encontrado = ((PessoaService)service).verificar(cpf, email);

        if(!encontrado) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.GET, path="/consumos")
    public ResponseEntity<?> findConsumosUsuario() {
        try {

            List<ConsumoUsuarioDTO> saida = consumoService.findConsumosUsuario(token.getUsername());
            if(saida == null || saida.size() == 0) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            } else {
                return new ResponseEntity<>(saida, HttpStatus.OK);
            }

        } catch (NegocioException ex) {
            Log.error(this.getClass(), ex);
            return new ResponseEntity<>(ex.getMessage(), HttpStatus.UNPROCESSABLE_ENTITY);

        } catch (Exception ex) {
            Log.error(this.getClass(), ex);
            return new ResponseEntity<>(ex.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @RequestMapping(method = RequestMethod.GET, path="/novaSenha")
    public ResponseEntity<?> reenvioSenha(HttpServletRequest request) {
        try {

            String accessToken = request.getHeader("Authorization");
            Token token = Application.readToken(accessToken);

            if(token != null) {
                ((PessoaService)service).alterarSenha(token);
                return new ResponseEntity<>(HttpStatus.OK);
            } else {
                return new ResponseEntity<>("token-invalido", HttpStatus.UNPROCESSABLE_ENTITY);
            }

        } catch (NegocioException ex) {
            Log.error(this.getClass(), ex);
            return new ResponseEntity<>(ex.getMessage(), HttpStatus.UNPROCESSABLE_ENTITY);

        } catch (Exception ex) {
            Log.error(this.getClass(), ex);
            return new ResponseEntity<>(ex.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
