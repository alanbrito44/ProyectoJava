/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

/**
 *
 * @author Karsa
 */
public class Conexion {
    private Connection conexion;

    public Connection getConexion() {
        return conexion;
    }

    public void setConexion(Connection conexion) {
        this.conexion = conexion;
    }
    
    public void conectar(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "carstoreto";
            String user = "root";
            String pass = "";
            String url = "jdbc:mysql://localhost/"+db+"?user="+user+"&password="+pass;
            conexion = DriverManager.getConnection(url);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error de conexión: "+e.getMessage());
        }
    } 
    
    public void desconectar(){
        try {
            if(!conexion.isClosed()){
                conexion.close();
            }
        } catch (Exception e) {
            System.out.println("Error: "+e.getMessage());
        }
    }    
}