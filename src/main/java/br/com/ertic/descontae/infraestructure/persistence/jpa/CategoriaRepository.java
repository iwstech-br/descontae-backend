package br.com.ertic.descontae.infraestructure.persistence.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.cdi.Eager;

import br.com.ertic.descontae.domain.model.Categoria;

@Eager
public interface CategoriaRepository extends JpaRepository<Categoria, Long> {

}