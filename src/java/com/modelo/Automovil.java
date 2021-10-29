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
public class Automovil {
    
    private int id_automovil;
    private String modelo_automovil;
    private Double precio;
    private String placa;
    private int ano;
    private String transmision;
    private int puertas;
    private Double kilometrage;
    private String color;
    private int id_marca;
    private int id_catAutomovil;
    private String imagen_auto;

    public Automovil() {
    }

    public Automovil(int id_automovil, String modelo_automovil, Double precio, String placa, int ano, String transmision, int puertas, Double kilometrage, String color, int id_marca, int id_catAutomovil, String imagen_auto) {
        this.id_automovil = id_automovil;
        this.modelo_automovil = modelo_automovil;
        this.precio = precio;
        this.placa = placa;
        this.ano = ano;
        this.transmision = transmision;
        this.puertas = puertas;
        this.kilometrage = kilometrage;
        this.color = color;
        this.id_marca = id_marca;
        this.id_catAutomovil = id_catAutomovil;
        this.imagen_auto = imagen_auto;
    }
    
    public String getImagen_auto() {
        return imagen_auto;
    }

    public void setImagen_auto(String imagen_auto) {
        this.imagen_auto = imagen_auto;
    }

    public int getId_automovil() {
        return id_automovil;
    }

    public void setId_automovil(int id_automovil) {
        this.id_automovil = id_automovil;
    }

    public String getModelo_automovil() {
        return modelo_automovil;
    }

    public void setModelo_automovil(String modelo_automovil) {
        this.modelo_automovil = modelo_automovil;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public String getTransmision() {
        return transmision;
    }

    public void setTransmision(String transmision) {
        this.transmision = transmision;
    }

    public int getPuertas() {
        return puertas;
    }

    public void setPuertas(int puertas) {
        this.puertas = puertas;
    }

    public Double getKilometrage() {
        return kilometrage;
    }

    public void setKilometrage(Double kilometrage) {
        this.kilometrage = kilometrage;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public int getId_catAutomovil() {
        return id_catAutomovil;
    }

    public void setId_catAutomovil(int id_catAutomovil) {
        this.id_catAutomovil = id_catAutomovil;
    }
    
    
}
