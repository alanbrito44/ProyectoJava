/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import com.conexion.Conexion;

/**
 *
 * @author Karsa
 */
public class Privilegios extends Conexion{
    
    private int id_privilegios;
    private String nombre_privilegio;
    private String descripcion;

    public Privilegios() {
    }

    public Privilegios(int id_privilegios, String nombre_privilegio, String descripcion) {
        this.id_privilegios = id_privilegios;
        this.nombre_privilegio = nombre_privilegio;
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_privilegios() {
        return id_privilegios;
    }

    public void setId_privilegios(int id_privilegios) {
        this.id_privilegios = id_privilegios;
    }

    public String getNombre_privilegio() {
        return nombre_privilegio;
    }

    public void setNombre_privilegio(String nombre_privilegio) {
        this.nombre_privilegio = nombre_privilegio;
    }
    
    
}
