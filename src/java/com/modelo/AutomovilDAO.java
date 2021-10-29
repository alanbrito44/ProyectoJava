/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modelo;

import com.conexion.Conexion;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Karsa
 */
public class AutomovilDAO extends Conexion {

    public void insertarAutomovil(Automovil a) {
        try {
            this.conectar();
            String sql = "INSERT INTO automovil (modelo_automovil,precio,placa,año,transmision,puertas,kilometrage,color,id_marca,id_catAutomovil,imagen_auto) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, a.getModelo_automovil());
            pre.setDouble(2, a.getPrecio());
            pre.setString(3, a.getPlaca());
            pre.setInt(4, a.getAno());
            pre.setString(5, a.getTransmision());
            pre.setInt(6, a.getPuertas());
            pre.setDouble(7, a.getKilometrage());
            pre.setString(8, a.getColor());
            pre.setInt(9, a.getId_marca());
            pre.setInt(10, a.getId_catAutomovil());
            pre.setString(11, a.getImagen_auto());
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
    }

    public ArrayList<Automovil> mostrarAutomovil() {
        ArrayList<Automovil> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM automovil";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                Automovil a = new Automovil();
                a.setId_automovil(rs.getInt(1));
                a.setModelo_automovil(rs.getString(2));
                a.setPrecio(rs.getDouble(3));
                a.setPlaca(rs.getString(4));
                a.setAno(rs.getInt(5));
                a.setTransmision(rs.getString(6));
                a.setPuertas(rs.getInt(7));
                a.setKilometrage(rs.getDouble(8));
                a.setColor(rs.getString(9));
                a.setId_marca(rs.getInt(10));
                a.setId_catAutomovil(rs.getInt(11));
                a.setImagen_auto(rs.getString(12));

                //agrenado los valores a la lista
                lista.add(a);
            }
        } catch (Exception e) {
            JOptionPane.showInputDialog(null, "Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

}
