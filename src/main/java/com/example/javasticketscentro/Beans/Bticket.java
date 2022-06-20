package com.example.javasticketscentro.Beans;

public class Bticket {
    private BCompra bCompra; //No lo uso, pero lo pondré por siacaso
    private BFuncion bFuncion;
    private String qr;
    private int cantButaca;

    public BCompra getbCompra() {
        return bCompra;
    }

    public void setbCompra(BCompra bCompra) {
        this.bCompra = bCompra;
    }

    public BFuncion getbFuncion() {
        return bFuncion;
    }

    public void setbFuncion(BFuncion bFuncion) {
        this.bFuncion = bFuncion;
    }

    public String getQr() {
        return qr;
    }

    public void setQr(String qr) {
        this.qr = qr;
    }

    public int getCantButaca() {
        return cantButaca;
    }

    public void setCantButaca(int cantButaca) {
        this.cantButaca = cantButaca;
    }
}
