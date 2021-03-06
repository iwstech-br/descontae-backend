package br.com.iwstech.descontae.interfaces.web;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import br.com.iwstech.descontae.domain.model.MarcaFranquia;
import br.com.iwstech.descontae.domain.service.MarcaFranquiaService;
import br.com.iwstech.descontae.interfaces.web.dto.HomeDetalheDTO;
import br.com.iwstech.descontae.interfaces.web.dto.HomeParceiroDTO;
import br.com.iwstech.util.geo.TimeCount;
import br.com.iwstech.util.infraestructure.web.RestFullEndpoint;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/api/franquias")
public class FranquiasController extends RestFullEndpoint<MarcaFranquia, Long> {

    @Autowired
    private MarcaFranquiaService srv;

    @Autowired
    public FranquiasController(MarcaFranquiaService service) {
        super(service);
    }

    @RequestMapping(value="/cidade/{idCidade}", method = RequestMethod.GET)
    public List<HomeParceiroDTO> findAllByCidade(
        @PathVariable("idCidade") Long idCidade,
        @RequestParam(required=false) Double lat,
        @RequestParam(required=false) Double lon,
        @RequestParam(required=false) String filtro,
        @RequestParam(required=false) String categorias,
        HttpServletResponse response) {
        TimeCount tc =  TimeCount.start(this.getClass(), "Processamento do método /api/franquias/cidade/{id}");

        String[] cats = null;
        if(categorias != null && categorias.length() > 0) {
            cats = categorias.split(",");
        }
        List<HomeParceiroDTO> saida = srv.findFranquiasByCidade(idCidade, filtro, lat, lon, cats);

        if(null == saida || saida.isEmpty()){
           response.setStatus(HttpStatus.SC_NO_CONTENT);
        }

        tc.end();
        return saida;
    }

    @RequestMapping(value="/unidade/{idUnidade}", method = RequestMethod.GET)
    public HomeDetalheDTO getParceiro(
        @PathVariable("idUnidade") Long idUnidade,
        @RequestParam(required=false) Double lat,
        @RequestParam(required=false) Double lon,
        HttpServletResponse response) {
        TimeCount tc =  TimeCount.start(this.getClass(), "Processamento do método /api/franquias/{id}/cidade/{idCidade}");

        HomeDetalheDTO saida = srv.detalharUnidade(idUnidade, lat, lon);

        if(null == saida){
           response.setStatus(HttpStatus.SC_NOT_FOUND);
        }

        tc.end();
        return saida;
    }

}

