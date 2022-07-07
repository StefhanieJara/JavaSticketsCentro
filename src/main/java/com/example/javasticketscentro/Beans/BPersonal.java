package com.example.javasticketscentro.Beans;


public class BPersonal {
    private int idPersonal;
    private String nombre;
    private String apellido;
    private BSede bSede;

    public int getIdPersonal() {
        return idPersonal;
    }

    public void setIdPersonal(int idPersonal) {
        this.idPersonal = idPersonal;
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

    public BSede getbSede() {
        return bSede;
    }

    public void setbSede(BSede bSede) {
        this.bSede = bSede;
    }
}
