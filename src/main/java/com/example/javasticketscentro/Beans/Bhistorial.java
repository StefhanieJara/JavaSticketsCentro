package com.example.javasticketscentro.Beans;

public class Bhistorial {
    private String fecha_compra;
    private String codigo;
    private String sede;
    private String fecha_funcion;
    private double total;
    private String estado;
    private int unidadades;
    private String pelicula;
    private double precio_por_peli;
    private double total_detalle;

    public String getFecha_compra() {
        return fecha_compra;
    }

    public void setFecha_compra(String fecha_compra) {
        this.fecha_compra = fecha_compra;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getSede() {
        return sede;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }

    public String getFecha_funcion() {
        return fecha_funcion;
    }

    public void setFecha_funcion(String fecha_funcion) {
        this.fecha_funcion = fecha_funcion;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getUnidadades() {
        return unidadades;
    }

    public void setUnidadades(int unidadades) {
        this.unidadades = unidadades;
    }

    public String getPelicula() {
        return pelicula;
    }

    public void setPelicula(String pelicula) {
        this.pelicula = pelicula;
    }

    public double getPrecio_por_peli() {
        return precio_por_peli;
    }

    public void setPrecio_por_peli(double precio_por_peli) {
        this.precio_por_peli = precio_por_peli;
    }

    public double getTotal_detalle() {
        return total_detalle;
    }

    public void setTotal_detalle(double total_detalle) {
        this.total_detalle = total_detalle;
    }
}
