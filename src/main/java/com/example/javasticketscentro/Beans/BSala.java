package com.example.javasticketscentro.Beans;

public class BSala {
    private int idSala;
    private int idSede;
    private int aforo;
    private int numero;
    private String nombre;
    private BSede bSede;

    public BSede getbSede() {
        return bSede;
    }

    public void setbSede(BSede bSede) {
        this.bSede = bSede;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdSala() {
        return idSala;
    }

    public void setIdSala(int idSala) {
        this.idSala = idSala;
    }

    public int getIdSede() {
        return idSede;
    }

    public void setIdSede(int idSede) {
        this.idSede = idSede;
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
