package com.example.javasticketscentro.Beans;

public class BSala {
    private int idSala;
    private int aforo;
    private int numero;
    private BSede bSede;

    public BSede getbSede() {
        return bSede;
    }

    public void setbSede(BSede bSede) {
        this.bSede = bSede;
    }

    public int getIdSala() {
        return idSala;
    }

    public void setIdSala(int idSala) {
        this.idSala = idSala;
    }

    public int getAforo() {
        return aforo;
    }

    public void setAforo(int aforo) {
        this.aforo = aforo;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }
}
