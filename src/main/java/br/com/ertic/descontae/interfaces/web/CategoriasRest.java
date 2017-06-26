package br.com.ertic.descontae.interfaces.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.ertic.descontae.domain.model.Categoria;
import br.com.ertic.descontae.domain.service.CategoriaService;
import br.com.ertic.util.infraestructure.web.RestFullEndpoint;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/categorias")
public class CategoriasRest extends RestFullEndpoint<Categoria, Long> {

    @Autowired
    public CategoriasRest(CategoriaService service) {
        super(service);
    }

}

