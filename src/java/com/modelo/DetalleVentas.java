/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

/**
 *
 * @author Javier Amaya
 */
public class DetalleVentas {
    
    private int id_detalle;
    private int id_cliente;
    private int id_automovil;
    private String garantia;

    public DetalleVentas() {
    }

    public DetalleVentas(int id_detalle, int id_cliente, int id_automovil, String garantia) {
        this.id_detalle = id_detalle;
        this.id_cliente = id_cliente;
        this.id_automovil = id_automovil;
        this.garantia = garantia;
    }

    public String getGarantia() {
        return garantia;
    }

    public void setGarantia(String garantia) {
        this.garantia = garantia;
    }

    public int getId_detalle() {
        return id_detalle;
    }

    public void setId_detalle(int id_detalle) {
        this.id_detalle = id_detalle;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getId_automovil() {
        return id_automovil;
    }

    public void setId_automovil(int id_automovil) {
        this.id_automovil = id_automovil;
    }
    
    
}
