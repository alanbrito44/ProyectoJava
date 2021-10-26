/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

/**
 *
 * @author Karsa
 */
public class Marca {
     
    private int id_marca;
    private String nombre_marca;
    private String descripcion;
    private String pais_marca;

    public Marca() {
    }

    public Marca(int id_marca, String nombre_marca, String descripcion, String pais_marca) {
        this.id_marca = id_marca;
        this.nombre_marca = nombre_marca;
        this.descripcion = descripcion;
        this.pais_marca = pais_marca;
    }

    public String getPais_marca() {
        return pais_marca;
    }

    public void setPais_marca(String pais_marca) {
        this.pais_marca = pais_marca;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public String getNombre_marca() {
        return nombre_marca;
    }

    public void setNombre_marca(String nombre_marca) {
        this.nombre_marca = nombre_marca;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
