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
public class DetalleVentasDAO extends Conexion{
    public void insertarDetalleVentas(DetalleVentas d){
        try {
            this.conectar();
            String sql = "INSERT INTO detalle_venta VALUES(?,?,?,?)";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, d.getId_detalle());
            pre.setInt(1, d.getId_cliente());
            pre.setInt(1, d.getId_automovil());
            pre.setString(2, d.getGarantia());
            
            pre.executeUpdate();          
            
                        
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
    public ArrayList<DetalleVentas> mostrarDetalleVentas(){
        ArrayList<DetalleVentas> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM detalle_venta";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
                DetalleVentas d = new DetalleVentas();
                d.setId_detalle(rs.getInt(1));
                d.setId_cliente(rs.getInt(2));
                d.setId_automovil(rs.getInt(3));
                d.setGarantia(rs.getString(4));
                
                lista.add(d);
            }            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public void modificarVentas(DetalleVentas d){
        try {
            this.conectar();
            String sql = "UPDATE detalle_venta SET id_cliente=?, id_automovil=?, garantia=? WHERE id_detalle=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);            
            pre.setInt(1, d.getId_cliente());
            pre.setInt(2, d.getId_automovil());
            pre.setString(4, d.getGarantia());
            pre.setInt(2, d.getId_detalle());
            pre.executeUpdate();
            
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
    
    public void eliminarVenta(DetalleVentas d){
        try {
            this.conectar();
            String sql = "DELETE FROM detalle_venta WHERE id_detalle=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, d.getId_detalle());
            
            pre.executeUpdate();
            
            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error: "+e.getMessage());
        } finally {
            this.desconectar();
        }
    }
}

