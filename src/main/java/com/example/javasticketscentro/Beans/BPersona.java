package com.example.javasticketscentro.Beans;

import java.util.Date;

public class BPersona {
    private int idPer;
    private String nombre;
    private int dni;
    private String apellido;
    private int numCel;
    private String foto;
    private int edad;
    private String email;
    private String usuario;
    private String contrasenia;
    private String direccion;
    private String rol;
    private int codigoPUCP;
    private String fecha_Nc;

    public String getFecha_Nc() {
        return fecha_Nc;
    }

    public void setFecha_Nc(String fecha_Nc) {
        this.fecha_Nc = fecha_Nc;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public int getIdPer() {
        return idPer;
    }

    public void setIdPer(int idPer) {
        this.idPer = idPer;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getNumCel() {
        return numCel;
    }

    public void setNumCel(int numCel) {
        this.numCel = numCel;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public int getCodigoPUCP() {
        return codigoPUCP;
    }

    public void setCodigoPUCP(int codigoPUCP) {
        this.codigoPUCP = codigoPUCP;
    }

}
