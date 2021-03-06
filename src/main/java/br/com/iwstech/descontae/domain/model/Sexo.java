package br.com.iwstech.descontae.domain.model;

public enum Sexo {

    M ("M", "Masculino"),
    F ("F", "Feminino");

    private String sigla;
    private String nome;

    private Sexo (String sigla, String nome) {
        this.sigla = sigla;
        this.nome = nome;
    }

    public String getSigla() {
        return sigla;
    }

    public String getNome() {
        return nome;
    }

}
