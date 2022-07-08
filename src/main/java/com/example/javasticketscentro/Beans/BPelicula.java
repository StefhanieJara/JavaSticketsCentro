package com.example.javasticketscentro.Beans;

import java.util.ArrayList;

public class BPelicula {
    private int idPelicula;
    private String nombre;
    private String restriccionEdad;
    private String sinopsis;
    private String duracion;
    private String foto;
    private double calificacionPelicula;
    private String genero;
    private ArrayList<BCelebridad> actores = new ArrayList<>();
    private ArrayList<BCelebridad> directores = new ArrayList<>();

    public ArrayList<BCelebridad> getActores() {
        return actores;
    }

    public void setActores(ArrayList<BCelebridad> actores) {
        this.actores = actores;
    }

    public ArrayList<BCelebridad> getDirectores() {
        return directores;
    }

    public void setDirectores(ArrayList<BCelebridad> directores) {
        this.directores = directores;
    }

    public int getIdPelicula() {
        return idPelicula;
    }

    public void setIdPelicula(int idPelicula) {
        this.idPelicula = idPelicula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getRestriccionEdad() {
        return restriccionEdad;
    }

    public void setRestriccionEdad(String restriccionEdad) {
        this.restriccionEdad = restriccionEdad;
    }

    public String getSinopsis() {
        return sinopsis;
    }

    public void setSinopsis(String sinopsis) {
        this.sinopsis = sinopsis;
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public double getCalificacionPelicula() {
        return calificacionPelicula;
    }

    public void setCalificacionPelicula(double calificacionPelicula) {
        this.calificacionPelicula = calificacionPelicula;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }
}
