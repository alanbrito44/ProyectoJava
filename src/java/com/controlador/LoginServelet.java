/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dougl
 */
public class LoginServelet extends HttpServlet {

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
                        Login login = new Login();
            if(request.getParameter("btnLogin")!=null){
                //recibiendo los valores que vengan del input
                String usuario = request.getParameter("txtUsuario");
                String clave = request.getParameter("txtClave");
                
                //guardando el valor de nivel de la funcion validarLogin
                int nivel = login.validarLogin(usuario, clave);
                
                //evaluamos si los datos eran correctos, en caso no sean correctos (que devuelva
                //0 filas entonces lo redirrecionamos al login nuevamente para que intente nuevamente
                if(nivel ==0){
                    response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
                }else{
                //caso contrario que si tenga fila tomamos los datos para la sesion y mandamos al login los datos
                //Con esto estamos pasando del controlador a la vista login.jsp dos variables
                request.setAttribute("usuario", usuario);
                request.setAttribute("clave", clave);
                request.setAttribute("nivel",nivel);
                
                //aqui estamos redireccionando a login para realizar unas comprobaciones con las variables creadas de arriba
                request.getRequestDispatcher("admin/login.jsp").forward(request, response);
                
                }

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
