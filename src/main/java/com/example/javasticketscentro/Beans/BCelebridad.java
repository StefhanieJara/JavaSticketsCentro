package com.example.javasticketscentro.Beans;

public class BCelebridad {
    private int idCelebridad;
    private String nombre;
    private String apellido;
    private String rol;
    private String foto;
    private BPelicula bPelicula;
    private int idPersona;
    private int puntaje;
    private double calificacion;

    public BPelicula getbPelicula() {
        return bPelicula;
    }

    public void setbPelicula(BPelicula bPelicula) {
        this.bPelicula = bPelicula;
    }

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

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public int getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(int puntaje) {
        this.puntaje = puntaje;
    }
}
