package com.example.javasticketscentro.Beans;

public class BFuncion {
    private int id;
    private double precio;
    private int stock;
    private String fecha;
    private String horaInicio;
    private float asistencia;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    public float getAsistencia() {
        return asistencia;
    }

    public void setAsistencia(float asistencia) {
        this.asistencia = asistencia;
    }
}
