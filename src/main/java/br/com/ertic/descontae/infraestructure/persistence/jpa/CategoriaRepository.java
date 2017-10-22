package br.com.ertic.descontae.infraestructure.persistence.jpa;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.cdi.Eager;

import br.com.ertic.descontae.domain.model.Categoria;
import br.com.ertic.util.infraestructure.jpa.RepositoryBase;

@Eager
public interface CategoriaRepository extends RepositoryBase<Categoria, Long> {

    @Query(value=
        "SELECT COUNT(*) " +
        "  FROM Unidade u " +
        "       INNER JOIN u.parceiro p, " +
        "       OfertaUnidade ou " +
        " WHERE ou.unidade = u AND p.excluido = 'N' ")
    Long findTotalEmUso(Long idCategoria);
}
