package com.example.javasticketscentro.Beans;

public class BFuncion {
    private int idFuncion;
    private double precio;
    private int stock;
    private String fecha;
    private BPelicula bPelicula;
    private BSala bSala;
    private BSede bSede;
    private String horaInicio;
    private float Asistencia;

    public BSede getbSede() {
        return bSede;
    }

    public void setbSede(BSede bSede) {
        this.bSede = bSede;
    }

    public float getAsistencia() {
        return Asistencia;
    }

    public void setAsistencia(float asistencia) {
        Asistencia = asistencia;
    }

    public BSala getbSala() {
        return bSala;
    }

    public void setbSala(BSala bSala) {
        this.bSala = bSala;
    }

    public BPelicula getbPelicula() {
        return bPelicula;
    }

    public void setbPelicula(BPelicula bPelicula) {
        this.bPelicula = bPelicula;
    }

    public int getIdFuncion() {
        return idFuncion;
    }

    public void setIdFuncion(int idFuncion) {
        this.idFuncion = idFuncion;
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


}
