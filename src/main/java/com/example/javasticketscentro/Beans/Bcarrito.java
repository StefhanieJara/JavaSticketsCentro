package com.example.javasticketscentro.Beans;

public class Bcarrito {
    private double precio;
    private double subtotal;
    private int cantidad;
    private String nombre_peli;
    private String sede;
    private double suma;


    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getNombre_peli() {
        return nombre_peli;
    }

    public void setNombre_peli(String nombre_peli) {
        this.nombre_peli = nombre_peli;
    }

    public String getSede() {
        return sede;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }

    public double getSuma() {
        return suma;
    }

    public void setSuma(double suma) {
        this.suma = suma;
    }
}