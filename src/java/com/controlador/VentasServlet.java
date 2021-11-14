/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modelo.DetalleVentas;
import com.modelo.DetalleVentasDAO;
import com.modelo.Ventas;
import com.modelo.VentasDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Javier Amaya
 */
public class VentasServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Ventas v = new Ventas();
            VentasDAO daoVentas = new VentasDAO();
            DetalleVentas d = new DetalleVentas();
            DetalleVentasDAO daoDetalle = new DetalleVentasDAO();
            
            v.setFecha(request.getParameter("txtFecha"));
            v.setId_venta(Integer.parseInt(request.getParameter("txtFactura")));
            v.setMonto_total(Float.valueOf(request.getParameter("total")));
            v.setId_detalle(Integer.parseInt(request.getParameter("codigo")));
            d.setId_detalle(Integer.parseInt(request.getParameter("codigo")));
            d.setId_cliente(Integer.parseInt(request.getParameter("txtCodigo")));
            d.setId_automovil(Integer.parseInt(request.getParameter("id_auto")));
            d.setGarantia(request.getParameter("garantia"));
            
            
            if(request.getParameter("btnGenerar")!=null){
                daoDetalle.insertarDetalleVentas(d);
                daoVentas.insertarVentas(v);
            }   
            request.getRequestDispatcher("ventas.jsp").forward(request, response);
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
