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
    public static final String UPLOAD_DIR = "recursos/Multimedia/ImagenesUpload";
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
            auto.setStock(Integer.parseInt(request.getParameter("txtStock")));
            auto.setDescripcion(request.getParameter("txtDescripcion"));

            switch (accion) {
                case "agregar": {

                    //partiendo los valores que vienen en el input txtImagen
                    Part part = request.getPart("txtImagen");
                    //llamando al metodo que extrae el nombre y que recibe como parametro el part
                    String fileName = extractFileName(part);

                    //obtiene la ruta absoluta de la aplicación web
                    //tiene como objetivo convertir una ruta de contenido web (la ruta en la estructura de carpetas WAR expandida en el sistema 
                    //de archivos de disco del servidor) en una ruta absoluta del sistema de archivos de disco.
                    String applicationPath = getServletContext().getRealPath("");
                    //aqui estamos guardardano la ruta absoluta la separamos por pleca y le agregamos la direccion que hemos puesto en UPLOAD_DIR
                    String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
                    System.out.println("applicationPath:" + applicationPath);

                    //Metodo que comprueba si la ruta que especificamos existe, si no existe esta ruta entonces la creamos en el proyecto
                    File fileUploadDirectory = new File(uploadPath);

                    if (!fileUploadDirectory.exists()) {
                        fileUploadDirectory.mkdirs();
                    }

                    //variable donde guardara la direccion donde se almacenan los archivos, una vez comprobado que la direccion existe o no
                    String savePath = uploadPath + File.separator + fileName;
                    System.out.println("savePath: " + savePath);
                    //guardando la ruta absoluta de la variable savePath
                    String sRootPath = new File(savePath).getAbsolutePath();
                    System.out.println("sRootPath: " + sRootPath);

                    part.write(savePath + File.separator);
                    File fileSaveDir1 = new File(savePath);

                    //variable que guarda el nombre del archivo que subimos
                    String dbFileName = UPLOAD_DIR + File.separator + fileName;
                    part.write(savePath + File.separator);

                    auto.setImagen_auto(dbFileName);
                    daoAuto.insertarAutomovil(auto);

                  
                            String action = "Crear Carro";
                            request.setAttribute("action",action);
                            request.setAttribute("resultado", true);
                            request.getRequestDispatcher("vistas/cars.jsp").forward(request, response);
                  
                }
                break;
                case "eliminar": {

                    auto.setId_automovil(Integer.parseInt(request.getParameter("txtIdAutomovil")));
                    daoAuto.eliminarAutomobil(auto);
                    
                            String action = "Eliminar Carro";
                            request.setAttribute("action",action);
                            request.setAttribute("resultado", true);
                            request.getRequestDispatcher("vistas/cars.jsp").forward(request, response);
                }
                break;
                case "editar": {

                    if (request.getPart("txtImagen").getSize() <= 0) {
                        auto.setImagen_auto(request.getParameter("txtRutaImg"));
                        auto.setId_automovil(Integer.parseInt(request.getParameter("txtIdAutomovil")));
                        daoAuto.modificarAutomovil(auto);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Automovil SIN IMAGEN modificado con exito');");
                        out.println("location='vistas/cars.jsp';");
                        out.println("</script>");
                    } else if (request.getPart("txtImagen").getSize() > 0) {

                        Part part = request.getPart("txtImagen");
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

                        auto.setImagen_auto(dbFileName);
                        auto.setId_automovil(Integer.parseInt(request.getParameter("txtIdAutomovil")));
                        daoAuto.modificarAutomovil(auto);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Automovil CON IMAGEN modificado con exito');");
                        out.println("location='vistas/cars.jsp';");
                        out.println("</script>");

                    }
                }
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

    //El código simplemente itera sobre todas las partes de la solicitud y guarda cada parte usando el método write (). El nombre del archivo se extrae 
    private String extractFileName(Part part) {//funcion que recibe como parametro part para extraer el nombre del multipart

        //aqui devolvemos el valor que viene en content-disposition como string ya que viene form-data name="dataFile" filename="PHOTO.JPG"
        String contentDisp = part.getHeader("content-disposition");
        //con esto haces un array donde guarda y separa lo que viene en content-disposition con ;
        String[] items = contentDisp.split(";");
        for (String s : items) {//luego recorremos el array
            //con trim, eliminamos los espacios que vienen en el string, y con startwith, le decimos que del string queremos es lo viene en filename
            if (s.trim().startsWith("filename")) {
                //con conseguimos el valor de filename
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
