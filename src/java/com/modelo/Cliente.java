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
public class Cliente {
    
    private int id_cliente;
    private String nombre;
    private String apellido;
    private int edad;
    private String telefono;
    private String direccion;
    private String numerodeidentidad;
    private String Nit;
    private int id_categoria_cliente;

    public Cliente() {
    }

    public Cliente(int id_cliente, String nombre, String apellido, int edad, String telefono, String direccion, String numerodeidentidad, String Nit, int id_categoria_cliente) {
        this.id_cliente = id_cliente;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.telefono = telefono;
        this.direccion = direccion;
        this.numerodeidentidad = numerodeidentidad;
        this.Nit = Nit;
        this.id_categoria_cliente = id_categoria_cliente;
    }

    public int getId_categoria_cliente() {
        return id_categoria_cliente;
    }

    public void setId_categoria_cliente(int id_categoria_cliente) {
        this.id_categoria_cliente = id_categoria_cliente;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
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

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNumerodeidentidad() {
        return numerodeidentidad;
    }

    public void setNumerodeidentidad(String numerodeidentidad) {
        this.numerodeidentidad = numerodeidentidad;
    }

    public String getNit() {
        return Nit;
    }

    public void setNit(String Nit) {
        this.Nit = Nit;
    }

    public void setId_cliente(String id_cliente) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}

