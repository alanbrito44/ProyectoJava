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
 * @author Karsa
 */
public class UsuarioDAO extends Conexion {

    public void insertarUsuario(Usuario u) {
        try {
            this.conectar();
            String sql = "INSERT INTO usuarios (usuario,contraseña,id_privilegio,nombre,apellido,imagen) VALUES (?,?,?,?,?,?)";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, u.getUsuario());
            pre.setString(2, u.getContraseña());
            pre.setInt(3, u.getId_privilegio());
            pre.setString(4, u.getNombre());
            pre.setString(5, u.getApellido());
            pre.setString(6, u.getImagen());
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
    }

    public ArrayList<Usuario> mostrarUsuario() {
        ArrayList<Usuario> lista = new ArrayList<>();
        try {
            this.conectar();
            String sql = "SELECT * FROM usuarios";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId_usuario(rs.getInt(1));
                u.setUsuario(rs.getString(2));
                u.setContraseña(rs.getString(3));
                u.setId_privilegio(rs.getInt(4));
                u.setNombre(rs.getString(5));
                u.setApellido(rs.getString(6));
                u.setImagen(rs.getString(7));

                //agrenado los valores a la lista
                lista.add(u);
            }
        } catch (Exception e) {
            JOptionPane.showInputDialog(null, "Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return lista;
    }

    public Usuario getImagen(int id) {
        Usuario u = new Usuario();
        try {
            this.conectar();
            String sql = "SELECT * FROM usuarios WHERE id_usuario=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs;
            rs = pre.executeQuery();
            while (rs.next()) {
                u.setId_usuario(rs.getInt(1));
                u.setUsuario(rs.getString(2));
                u.setContraseña(rs.getString(3));
                u.setId_privilegio(rs.getInt(4));
                u.setNombre(rs.getString(5));
                u.setApellido(rs.getString(6));
                u.setImagen(rs.getString(7));
            }
        } catch (Exception e) {
            JOptionPane.showInputDialog(null, "Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
        return u;
    }

    public void eliminarUsuario(Usuario u) {
        try {
            this.conectar();
            String sql = "DELETE FROM usuarios WHERE id_usuario=?";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setInt(1, u.getId_usuario());
            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showInputDialog(null, "Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
    }

    public void modificarUsuario(Usuario u) {
        try {
            this.conectar();
            String sql = "UPDATE usuarios SET usuario=?, contraseña=?, id_privilegio=?, nombre=?, apellido=?, imagen=? WHERE id_usuario=? ";
            PreparedStatement pre = this.getConexion().prepareStatement(sql);
            pre.setString(1, u.getUsuario());
            pre.setString(2, u.getContraseña());
            pre.setInt(3, u.getId_privilegio());
            pre.setString(4, u.getNombre());
            pre.setString(5, u.getApellido());
            pre.setString(6, u.getImagen());
            pre.setInt(7, u.getId_usuario());

            pre.executeUpdate();
        } catch (Exception e) {
            JOptionPane.showInputDialog(null, "Error: " + e.getMessage());
        } finally {
            this.desconectar();
        }
    }
}
