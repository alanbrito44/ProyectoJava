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
public class Usuario {
    
    private int id_usuario;
    private String usuario;
    private String contraseña;
    private int id_privilegio;
    private String nombre;
    private String apellido;
    private String imagen;

    public Usuario() {
    }

    public Usuario(int id_usuario, String usuario, String contraseña,int id_privilegio, String nombre, String apellido, String imagen) {
        this.id_usuario = id_usuario;
        this.usuario = usuario;
        this.contraseña = contraseña;
        this.id_privilegio = id_privilegio;
        this.nombre = nombre;
        this.apellido = apellido;
        this.imagen = imagen;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public int getId_privilegio() {
        return id_privilegio;
    }

    public void setId_privilegio(int id_privilegio) {
        this.id_privilegio = id_privilegio;
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

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }
    
    
    
}
