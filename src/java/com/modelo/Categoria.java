/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

/**
 *
 * @author dougl
 */
public class Categoria {
    private int idCat;
    private String nombreCat;

    public Categoria() {
    }

    public Categoria(int idCat, String nombreCat) {
        this.idCat = idCat;
        this.nombreCat = nombreCat;
    }

    public void setNombreCat(String nombreCat) {
        this.nombreCat = nombreCat;
    }

    public void setIdCat(int idCat) {
        this.idCat = idCat;
    }

    public int getIdetCat() {
        return idCat;
    }

    public String getNombreCat() {
        return nombreCat;
    }
    
    
}
