package com.example.javasticketscentro.Beans;

public class BTarjeta {
    private String numerTar;
    private String fechaV;
    private int CVV;
    private String banco;
    private String tipo;
    private int idTarjeta;

    public int getIdTarjeta() {
        return idTarjeta;
    }

    public void setIdTarjeta(int idTarjeta) {
        this.idTarjeta = idTarjeta;
    }

    public String getNumerTar() {
        return numerTar;
    }

    public void setNumerTar(String numerTar) {
        this.numerTar = numerTar;
    }

    public String getFechaV() {
        return fechaV;
    }

    public void setFechaV(String fechaV) {
        this.fechaV = fechaV;
    }

    public int getCVV() {
        return CVV;
    }

    public void setCVV(int CVV) {
        this.CVV = CVV;
    }

    public String getBanco() {
        return banco;
    }

    public void setBanco(String banco) {
        this.banco = banco;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}
