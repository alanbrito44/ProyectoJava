/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import com.conexion.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Javier Amaya
 */
public class VentasDAO extends Conexion{    
    public void insertarVentas(Ventas v){
        try {
            this.conectar();
            String sql = "INSERT INTO ventas VALUES(?,?,?,?)";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, v.getId_venta());
            pre.setString(2, v.getFecha());
            pre.setFloat(3, v.getMonto_total());
            pre.setInt(4, v.getId_detalle());
            
            pre.executeUpdate();          
            
                        
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
    public ArrayList<Ventas> mostrarVentas(){
        ArrayList<Ventas> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM ventas";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                Ventas v = new Ventas();
                v.setId_venta(rs.getInt(1));
                v.setFecha(rs.getString(2));
                v.setMonto_total(rs.getFloat(3));
                v.setId_detalle(rs.getInt(4));
                
                lista.add(v);
            }            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public void modificarVentas(Ventas v){
        try {
            this.conectar();
            String sql = "UPDATE ventas SET fecha=?, monto_total=?, id_detalle=? WHERE id_venta=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);            
            pre.setString(1, v.getFecha());
            pre.setFloat(2, v.getMonto_total());
            pre.setInt(3, v.getId_detalle());
            pre.setInt(4, v.getId_venta());
            pre.executeUpdate();
            
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
    
    public void eliminarVenta(Ventas v){
        try {
            this.conectar();
            String sql = "DELETE FROM ventas WHERE id_venta=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, v.getId_venta());
            
            pre.executeUpdate();
            
            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
}

