package com.example.javasticketscentro.Beans;

import java.time.Clock;
import java.util.Date;

public class Bcarrito {
    private double precio;
    private String pelicula;
    private Date fecha;
    private Clock horaInicio;
    private int sala;
    private int cantidad;
    private String sede;

    public String getPelicula() {
        return pelicula;
    }

    public void setPelicula(String pelicula) {
        this.pelicula = pelicula;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Clock getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(Clock horaInicio) {
        this.horaInicio = horaInicio;
    }

    public int getSala() {
        return sala;
    }

    public void setSala(int sala) {
        this.sala = sala;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }



    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }



    public String getSede() {
        return sede;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }

}