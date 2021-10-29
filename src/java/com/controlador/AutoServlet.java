/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modelo.Automovil;
import com.modelo.AutomovilDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Karsa
 */
public class AutoServlet extends HttpServlet {

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

            Automovil auto = new Automovil();
            AutomovilDAO daoAuto = new AutomovilDAO();

            auto.setModelo_automovil(request.getParameter("txtModelo"));
            auto.setPrecio(Double.parseDouble(request.getParameter("txtPrecio")));
            auto.setPlaca(request.getParameter("txtPlaca"));
            auto.setAno(Integer.parseInt(request.getParameter("txtAno")));
            auto.setTransmision(request.getParameter("txtTransmision"));
            auto.setPuertas(Integer.parseInt(request.getParameter("txtPuerta")));
            auto.setKilometrage(Double.parseDouble(request.getParameter("txtKilometrage")));
            auto.setColor(request.getParameter("txtColor"));
            auto.setId_marca(Integer.parseInt(request.getParameter("sMarca")));
            auto.setId_catAutomovil(Integer.parseInt(request.getParameter("sCategoria")));
            auto.setImagen_auto(request.getParameter("txtImagen"));

            if (request.getParameter("btnAgregarA") != null) {
                daoAuto.insertarAutomovil(auto);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Modelo ingresado con exito');");
                out.println("location='vistas/cars.jsp';");
                out.println("</script>");
            }
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
