package br.com.ertic.descontae.domain.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import br.com.ertic.util.infraestructure.domain.model.EntidadeBase;

@Entity
@Table(name = "TB_PESSOA_FISICA")
public class Pessoa extends EntidadeBase<Long> {

    private static final long serialVersionUID = -4314049694000865586L;

    public static final int MAX_LENGTH_CPF = 11;
    public static final int MAX_LENGTH_INSTAGRAM = 50;
    public static final int MAX_LENGTH_FACEBOOK = 50;
    public static final int MAX_LENGTH_TELEFONE = 15;
    public static final int MAX_LENGTH_NOME = 100;
    public static final int MAX_LENGTH_EMAIL = 100;
    public static final int MAX_LENGTH_IDIOMA = 5;
    public static final int MAX_LENGTH_SEXO = 1;

    @Id
    @Column(name="ID_PESSOA")
    @SequenceGenerator(name="SEQ_PESSOA_FISICA", sequenceName="SEQ_PESSOA_FISICA", allocationSize=1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator="SEQ_PESSOA_FISICA")
    private Long id;

    @Column(name="NOME", length=MAX_LENGTH_NOME, nullable=false)
    private String nome;

    @Column(name="EMAIL", length=MAX_LENGTH_EMAIL, nullable=false)
    private String email;

    @Column(name="CPF", length=MAX_LENGTH_CPF, nullable=true)
    private String cpf;

    @Column(name="TELEFONE", length=MAX_LENGTH_TELEFONE, nullable=true)
    private String telefone;

    @Column(name="FACEBOOK", length=MAX_LENGTH_FACEBOOK, nullable=true)
    private String facebook;

    @Column(name="INSTAGRAM", length=MAX_LENGTH_INSTAGRAM, nullable=true)
    private String instagram;

    @Column(name="IDIOMA", length=MAX_LENGTH_IDIOMA, nullable=false)
    private String idioma;

    @Temporal(TemporalType.DATE)
    @Column(name="DATA_CADASTRO", nullable=false)
    private Date dataCadastro;

    @Temporal(TemporalType.DATE)
    @Column(name="DATA_ULTIMA_ATUALIZACAO", nullable=false)
    private Date dataAlteracao;

    @Temporal(TemporalType.DATE)
    @Column(name="DATA_NASCIMENTO", nullable=false)
    private Date dataNascimento;

    @Enumerated(EnumType.STRING)
    @Column(name="SEXO", length=MAX_LENGTH_SEXO, nullable=false)
    private Sexo sexo;

    @OneToMany(mappedBy="pessoa")
    private List<Telefone> telefones;

    @ManyToOne
    @JoinColumn(name="ID_TIPO_PESSOA", nullable=false)
    private TipoPessoa tipoPessoa;

    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="ID_ENDERECO", nullable=true)
    private Endereco endereco;

    @Transient
    private String senha;

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getInstagram() {
        return instagram;
    }

    public void setInstagram(String instagram) {
        this.instagram = instagram;
    }

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    public Date getDataAlteracao() {
        return dataAlteracao;
    }

    public void setDataAlteracao(Date dataAlteracao) {
        this.dataAlteracao = dataAlteracao;
    }

    public TipoPessoa getTipoPessoa() {
        return tipoPessoa;
    }

    public void setTipoPessoa(TipoPessoa tipoPessoa) {
        this.tipoPessoa = tipoPessoa;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public List<Telefone> getTelefones() {
        return telefones;
    }

    public void setTelefones(List<Telefone> telefones) {
        this.telefones = telefones;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

}
