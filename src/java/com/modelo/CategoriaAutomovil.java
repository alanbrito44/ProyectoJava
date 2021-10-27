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
public class CategoriaAutomovil {
    
    private int id_catAutomovil;
    private String nombre_categoria;
    private String descripcion;

    public CategoriaAutomovil() {
    }

    public CategoriaAutomovil(int id_catAutomovil, String nombre_categoria, String descripcion) {
        this.id_catAutomovil = id_catAutomovil;
        this.nombre_categoria = nombre_categoria;
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_catAutomovil() {
        return id_catAutomovil;
    }

    public void setId_catAutomovil(int id_catAutomovil) {
        this.id_catAutomovil = id_catAutomovil;
    }

    public String getNombre_categoria() {
        return nombre_categoria;
    }

    public void setNombre_categoria(String nombre_categoria) {
        this.nombre_categoria = nombre_categoria;
    }
    
    
}
