package com.example.javasticketscentro.Beans;

public class BCompra {
    private String idCompra;
    private int IdPer;
    private Double montoTotal;
    private int cancelado;

    public int getCancelado() {
        return cancelado;
    }

    public void setCancelado(int cancelado) {
        this.cancelado = cancelado;
    }

    public String getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(String idCompra) {
        this.idCompra = idCompra;
    }

    public int getIdPer() {
        return IdPer;
    }

    public void setIdPer(int idPer) {
        IdPer = idPer;
    }

    public Double getMontoTotal() {
        return montoTotal;
    }

    public void setMontoTotal(Double montoTotal) {
        this.montoTotal = montoTotal;
    }
}
