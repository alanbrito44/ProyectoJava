/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import com.conexion.Conexion;
import static java.lang.System.out;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Javier Amaya
 */
public class VentasDAO extends Conexion{    
   public int generarFactura(){
       int factura = 0;
       try {
           this.conectar();
           String sql = "select max(id_venta) as idVentas from ventas";
           PreparedStatement numero = this.getConexion().prepareStatement(sql);
           ResultSet numeroFac = numero.executeQuery();
           while (numeroFac.next()) {               
               factura = numeroFac.getInt("idVentas");
           }
       } catch (Exception e) {
           
           out.println(e.getMessage());
           factura = 0;
           
       }
       finally{
       this.desconectar();
       }
       return factura;
   }
   
   public boolean generarVenta(Ventas v){
       try {
           this.conectar();
           String sql = "insert into ventas values (null,?,?,?)";
           PreparedStatement numero = this.getConexion().prepareStatement(sql);
           numero.setString(1, v.getFecha());
           numero.setFloat(2, v.getMonto_total());
           numero.setInt(3, v.getId_cliente());
           numero.executeUpdate();
           return true;
           
       } catch (Exception e) {
           
           out.println(e.getMessage());
           return false;
           
       }
       finally{
       this.desconectar();
       }
   }
   
}

