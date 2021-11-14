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
public class Ventas {
    
    private int id_venta;
    private String fecha;
    private float monto_total;
    private int id_cliente;

    public Ventas() {
    }

    public Ventas(int id_venta, String fecha, float monto_total, int id_cliente) {
        this.id_venta = id_venta;
        this.fecha = fecha;
        this.monto_total = monto_total;
        this.id_cliente = id_cliente;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public float getMonto_total() {
        return monto_total;
    }

    public void setMonto_total(float monto_total) {
        this.monto_total = monto_total;
    }
    
    
}

