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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Karsa
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class AutomovilServlet extends HttpServlet {

    //variable global con la ruta donde se guardaran las imagens, la cual no cambiara de valor por el final
    public static final String UPLOAD_DIR = "recursos/Multimedia/Imagenes";
    //variable donde se guarda el nombre de la imagen
    public String dbFileName = "";

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

            String accion = request.getParameter("accion");
            Automovil auto = new Automovil();
            AutomovilDAO daoAuto = new AutomovilDAO();

            switch (accion) {
                case "agregar":

                    //partiendo los valores que vienen en el input txtImagen
                    Part part = request.getPart("txtImagen");
                    //extrayendo el nombre del archivo que viene en part
                    String fileName = extractFileName(part);

                    String applicationPath = getServletContext().getRealPath("");
                    String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
                    System.out.println("applicationPath:" + applicationPath);
                    File fileUploadDirectory = new File(uploadPath);
                    if (!fileUploadDirectory.exists()) {
                        fileUploadDirectory.mkdirs();
                    }
                    String savePath = uploadPath + File.separator + fileName;
                    System.out.println("savePath: " + savePath);
                    String sRootPath = new File(savePath).getAbsolutePath();
                    System.out.println("sRootPath: " + sRootPath);
                    part.write(savePath + File.separator);
                    File fileSaveDir1 = new File(savePath);
                    
                    String dbFileName = UPLOAD_DIR + File.separator + fileName;
                    part.write(savePath + File.separator);

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
                    auto.setImagen_auto(dbFileName);

                    daoAuto.insertarAutomovil(auto);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Autmovil ingresado con exito');");
                    out.println("location='vistas/cars.jsp';");
                    out.println("</script>");

                case "eliminar":

                    auto.setId_automovil(Integer.parseInt(request.getParameter("txtIdAutomovil")));
                    daoAuto.eliminarAutomobil(auto);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Automovil eliminado con exito');");
                    out.println("location='vistas/cars.jsp';");
                    out.println("</script>");

                    break;

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

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
