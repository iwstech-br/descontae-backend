package br.com.ertic.descontae.domain.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.ertic.util.infraestructure.domain.model.EntidadeBase;

@Entity
@Table(name = "TB_PLANO")
public class Plano extends EntidadeBase<Long> {

    private static final long serialVersionUID = 2427304382876951007L;

    public static final int MAX_LENGTH_TITULO = 30;
    public static final int MAX_LENGTH_DESCRICAO = 500;

    @Id
    @Column(name="ID_PLANO", columnDefinition = "serial")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="TITULO", length=MAX_LENGTH_TITULO, nullable=false)
    private String titulo;

    @Column(name="DESCRICAO", length=MAX_LENGTH_DESCRICAO, nullable=true)
    private String descricao;

    @Column(name="VALOR", nullable=false)
    private Double valor;

    @Temporal(TemporalType.DATE)
    @Column(name="INICIO_VIGENCIA", nullable=false)
    private Date inicioVigencia;

    @Temporal(TemporalType.DATE)
    @Column(name="FIM_VIGENCIA", nullable=true)
    private Date fimVigencia;

    @Enumerated(EnumType.STRING)
    @Column(name="SITUACAO", nullable=false)
    private SituacaoPlano situacao;

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public Date getInicioVigencia() {
        return inicioVigencia;
    }

    public void setInicioVigencia(Date inicioVigencia) {
        this.inicioVigencia = inicioVigencia;
    }

    public Date getFimVigencia() {
        return fimVigencia;
    }

    public void setFimVigencia(Date fimVigencia) {
        this.fimVigencia = fimVigencia;
    }

    public SituacaoPlano getSituacao() {
        return situacao;
    }

    public void setSituacao(SituacaoPlano situacao) {
        this.situacao = situacao;
    }


}