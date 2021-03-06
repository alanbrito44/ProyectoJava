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
            String sql = "INSERT INTO automovil (modelo_automovil,precio,placa,año,transmision,puertas,kilometrage,color,id_marca,id_catAutomovil,stock,descripcion,garantia,imagen_auto) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            pre.setInt(11, a.getStock());
            pre.setString(12, a.getDescripcion());
            pre.setString(13, a.getGarantia());
            pre.setString(14, a.getImagen_auto());
            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showInputDialog(null, "Error: " + e.getMessage());
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
                a.setStock(rs.getInt(13));
                a.setDescripcion(rs.getString(14));
                a.setGarantia(rs.getString(15));

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
    
    public Automovil getImagen(int id){
        Automovil a = new Automovil();
        try{
            this.conectar();
            String sql = "SELECT * FROM automovil WHERE id_automovil=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs;
            rs = pre.executeQuery();
            while(rs.next()){
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
            }
        }catch(Exception e){
            JOptionPane.showInputDialog(null, "Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
        return a;
    }
    
    public void eliminarAutomobil(Automovil a){
        try{
            this.conectar();
            String sql = "DELETE FROM automovil WHERE id_automovil=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, a.getId_automovil());
            pre.executeUpdate();
        }catch(Exception e){
            JOptionPane.showInputDialog(null, "Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
    }
    
    public void modificarAutomovil(Automovil a){
        try{
            this.conectar();
            String sql = "UPDATE automovil SET modelo_automovil=?, precio=?, placa=?, año=?, transmision=?, puertas=?, kilometrage=?,"
                          + "color=?, id_marca=?, id_catAutomovil=?, stock=?, descripcion=?, garantia=?, imagen_auto=? WHERE id_automovil=? ";
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
            pre.setInt(11, a.getStock());
            pre.setString(12, a.getDescripcion());
            pre.setString(13, a.getGarantia());
            pre.setString(14, a.getImagen_auto());
            pre.setInt(15,a.getId_automovil());
            //en este caso como se esta realizando un update se ocupa el executeUpdate, para ejecutar la consulta
            pre.executeUpdate();
        }catch(Exception e){
            JOptionPane.showInputDialog(null, "Error: "+e.getMessage());
        }finally{
            this.desconectar();
        }
    }
    
    public ArrayList<Automovil> mostrarAutomovilID(int id) {
        ArrayList<Automovil> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM automovil WHERE id_automovil=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, id);
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
                a.setStock(rs.getInt(13));
                a.setDescripcion(rs.getString(14));
                a.setGarantia(rs.getString(15));

                lista.add(a);
            }
        } catch (Exception e) {
            JOptionPane.showInputDialog(null, "Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }
    
    public ArrayList<Automovil> mostrarAutomovilTop() {
        ArrayList<Automovil> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM automovil WHERE stock > 0 ORDER BY ID_AUTOMOVIL DESC LIMIT 5";
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
                a.setStock(rs.getInt(13));
                a.setDescripcion(rs.getString(14));
                a.setGarantia(rs.getString(15));
                
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
    
    public ArrayList<Automovil> mostrarAutomovilTopDescrip() {
        ArrayList<Automovil> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM automovil WHERE stock > 0 ORDER BY ID_AUTOMOVIL DESC LIMIT 3";
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
                a.setStock(rs.getInt(13));
                a.setDescripcion(rs.getString(14));
                a.setGarantia(rs.getString(15));

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
