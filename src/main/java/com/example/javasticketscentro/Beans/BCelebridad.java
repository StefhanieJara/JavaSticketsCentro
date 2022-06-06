package com.example.javasticketscentro.Beans;

public class BCelebridad {
    private int idCelebridad;
    private String nombre;
    private String apellido;
    private String rol;
    private String foto;
    private double calificacion;

    public double getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(double calificacion) {
        this.calificacion = calificacion;
    }


    public int getIdCelebridad() {
        return idCelebridad;
    }

    public void setIdCelebridad(int idCelebridad) {
        this.idCelebridad = idCelebridad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }
}
