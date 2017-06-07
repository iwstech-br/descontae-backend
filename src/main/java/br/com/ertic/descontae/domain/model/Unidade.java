package br.com.ertic.descontae.domain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import br.com.ertic.util.infraestructure.domain.model.EntidadeBase;

@Entity
@Table(name = "TB_UNIDADE")
public class Unidade extends EntidadeBase<Long> {

    private static final long serialVersionUID = 5200631229042999757L;

    public static final int MAX_LENGTH_NOME = 50;
    public static final int MAX_LENGTH_TELEFONE = 15;

    @Id
    @Column(name="ID_UNIDADE", columnDefinition = "serial")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="NOME", length=MAX_LENGTH_NOME, nullable=false)
    private String nome;

    @Column(name="TELEFONE", length=MAX_LENGTH_TELEFONE, nullable=true)
    private String telefone;

    @Column(name="ID_EMPREENDIMENTO", nullable=false)
    private Long idEmpreendimento;

    @Temporal(TemporalType.TIME)
    @Column(name="INICIO_EXPEDIENTE", nullable=true)
    private Long inicioExpediente;

    @Temporal(TemporalType.TIME)
    @Column(name="FIM_EXPEDIENTE", nullable=true)
    private Long fimExpediente;

    @ManyToOne
    @JoinColumn(name="ID_ENDERECO", nullable=false)
    private Endereco endereco;

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public Long getIdEmpreendimento() {
        return idEmpreendimento;
    }

    public void setIdEmpreendimento(Long idEmpreendimento) {
        this.idEmpreendimento = idEmpreendimento;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public Long getInicioExpediente() {
        return inicioExpediente;
    }

    public void setInicioExpediente(Long inicioExpediente) {
        this.inicioExpediente = inicioExpediente;
    }

    public Long getFimExpediente() {
        return fimExpediente;
    }

    public void setFimExpediente(Long fimExpediente) {
        this.fimExpediente = fimExpediente;
    }

}
