/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modelo.Blog;
import com.modelo.BlogDao;
import com.modelo.BlogDescripcion;
import com.modelo.BlogDescripcionDao;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.Calendar;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author dougl
 */
@MultipartConfig
public class blogControl extends HttpServlet {

    private String UPLOAD_DIR = "recursos/Multimedia/imagenesupload/";
  
 
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
            /* TODO output your page here. You may use following sample code. */
            
            //obtenemos el valor del boton
            String accion = request.getParameter("Accion");            
           
          //lo evaluamos 
          switch(accion){
                case "Ingresar":
                    //si es ingresar obtenemos la imagen y su nombre del formulario
                    String imgNombre = request.getPart("imgDescripcion").getSubmittedFileName();
                    Part imagen = request.getPart("imgDescripcion");
                    InputStream is = imagen.getInputStream();
                    
                    //comprobamos si viene imagen o no.
                   if(imagen.getSize()>0){
                        //llamo a la funcion que cree para subir imagen y lo seteo a un booleano
                    boolean resp = subirImagen(imgNombre, is);
                    
                    //si la carga de la imagen es verddera proceso a insertar los datos a la BD
                    if(resp){
                        
                        //primero creo el objeto blog (tabla intermedia entre usuario y blod_detalle)
                        BlogDao blogDao = new BlogDao();
                        int idUser = Integer.parseInt(request.getParameter("txtUsuario"));
                        blogDao.crearBlog(idUser);
                        
                        //mando a llamar el ultimo ID de la tabala blog que fue insertado para pasarlo 
                        //como foraneo a la tabla blod_detalle
                        int blogId=blogDao.obtenerIdBlog();
                        
                        
                        //creo el blod_descripcion para setear datos
                        BlogDescripcion blogModel = new BlogDescripcion();
                        blogModel.setIdBlog(blogId);
                        blogModel.setTitulo(request.getParameter("txtTitulo"));
                        blogModel.setDescrip(request.getParameter("txtDescripcion"));
                        blogModel.setImgPortada(imgNombre);
                        blogModel.setContenido(request.getParameter("txtContenido"));
                        blogModel.setIdCat(Integer.parseInt(request.getParameter("sCategoria")));
                        
                        //creamos instancia calendar para crear la fecha del momento en que se crea el blog
                        
                        Calendar fecha = new GregorianCalendar();
                        
                        //obtenemos el día del mes
                          int dia = fecha.get(Calendar.DAY_OF_MONTH);
                        //obtenemos el mes del año
                          int mes = fecha.get(Calendar.MONTH);
                        //obtenemos el año
                         int año = fecha.get(Calendar.YEAR);
                        
                         //armamos la estructura de la fecha
                         
                         String fechaActual = String.valueOf(dia)+ "/"+String.valueOf(mes)+"/"+String.valueOf(año);
                         
                         //seteamos la hora al objeto
                         
                         blogModel.setFecha(fechaActual);
                        //hago el insert del blog y su contenido
                        BlogDescripcionDao blogDescDao = new BlogDescripcionDao();
                        
                        if(blogDescDao.insertarBlog(blogModel)){
                            //si se inserto mandamos alerta y redireccionamos
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Blog Creado con exito');");
                            out.println("location='vistas/blogs.jsp';");
                            out.println("</script>");
                        }else{
                            //si no se inserto mandamos alerta y redireccionamos
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('No se pudo crear el blog, intenta de nuevo');");
                            out.println("location='vistas/blogs.jsp';");
                            out.println("</script>");
                        }
                    }else{
                        //si no se carga la imagen damos aviso
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('No Se Pudo Cargar La Imagen Seleccionada, Intenta de Nuevo');");
                        out.println("location='vistas/blogs.jsp';");
                        out.println("</script>");
                    }
                   }else{
                       //si no viene imagen redireecionamos con alerta
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('No Se Selecciono Ninguna Imagen');");
                        out.println("location='vistas/blogs.jsp';");
                        out.println("</script>");
                   }
                    
                break;
                case "Eliminar":
                    int id = Integer.parseInt(request.getParameter("actionId"));

                    BlogDescripcionDao bdo = new BlogDescripcionDao();
                    if (bdo.eliminarBlogContenido(id)) {
                        BlogDao bdao = new BlogDao();
                        if (bdao.eliminarBlog(id)) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Entada Eliminada');");
                            out.println("location='vistas/blogs.jsp';");
                            out.println("</script>");
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('No Se Pudo Eliminar La Entrada, Intenta de Nuevo');");
                            out.println("location='vistas/blogs.jsp';");
                            out.println("</script>");
                        }
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('No Se Pudo Eliminar La Entrada, Intenta de Nuevo');");
                        out.println("location='vistas/blogs.jsp';");
                        out.println("</script>");
                    }
                break;
                case "Guardar":
                        int codigoUsuario = Integer.parseInt(request.getParameter("txtUsuario"));
                        int codigoBlog = Integer.parseInt(request.getParameter("txtIdBlog"));
                        String tituloBlog = request.getParameter("txtTitulo");
                        String descripcionBlog = request.getParameter("txtDescripcion");
                        String nombreImagen = request.getPart("imgDescripcion").getSubmittedFileName();   
                        String contenidoBlog = request.getParameter("txtContenido");
                        int codigoCategoria = Integer.parseInt(request.getParameter("sCategoria"));
                        
                        if(nombreImagen.length()>0){
                           Part imagenBlog = request.getPart("imgDescripcion");
                           InputStream isBlog = imagenBlog.getInputStream();

                           boolean subidaFile = subirImagen(nombreImagen, isBlog);
                           if(subidaFile){
                              BlogDao bdao = new BlogDao();
                              if(bdao.modificarBlog(codigoBlog,codigoUsuario)){
                                 Calendar fecha = new GregorianCalendar();
                        
                                //obtenemos el día del mes
                                  int dia = fecha.get(Calendar.DAY_OF_MONTH);
                                //obtenemos el mes del año
                                  int mes = fecha.get(Calendar.MONTH);
                                //obtenemos el año
                                 int año = fecha.get(Calendar.YEAR);
                                 String fechaActual = String.valueOf(dia)+ "/"+String.valueOf(mes)+"/"+String.valueOf(año);
                                 
                                 BlogDescripcion b= new BlogDescripcion();
                                 b.setTitulo(tituloBlog);
                                 b.setImgPortada(nombreImagen);
                                 b.setDescrip(descripcionBlog);
                                 b.setContenido(contenidoBlog);
                                 b.setFecha(fechaActual);
                                 b.setIdCat(codigoCategoria);
                                 b.setIdBlog(codigoBlog);
                                 
                                 BlogDescripcionDao bd = new BlogDescripcionDao();
                                 if(bd.modificarBlogImg(b)){
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert('Entada Editada');");
                                    out.println("location='vistas/blogs.jsp';");
                                    out.println("</script>");
                                 }
                              }
                           }else{
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert('No Se Pudo Subir La Imagen Al Servidor, Intenta De Nuevo');");
                                    out.println("location='vistas/blogs.jsp';");
                                    out.println("</script>");
                           }
                        }else{
                            out.println("llego sin imagen");
                        }
                        
                break;

            }

        }
    }

    /**
     *
     * funcion que sube imagen a carpeta del servidor recive un string con el
     * nombre y el inputstream de la imagen para escribirla en la carpeta
     * retorna un booleano segun tenga exito o no
     *
    
    */
    private boolean subirImagen(String imgNombre, InputStream is) throws FileNotFoundException, IOException{
       //creamos el directorio donde se va a subir la imagen
        String uploadPath =getServletContext().getRealPath("") + "\\"+ File.separator + UPLOAD_DIR + "\\";
        //creamos el archivo en la ruta antes establecida
        File f = new File(uploadPath + imgNombre);
        //creamos la clase para usar el metodo de escritura de archivos con el metodo write;
        FileOutputStream ous = new FileOutputStream(f);
        //obtenemos los datos o serie de numeros que forman la imagen
        int datoImg = is.read();
        
        try {
            //mientras su valor sea diferente a -1 (en -1 es que ya no hay datos que leer o escribir)
            while (datoImg != -1) {
                //que escriba la imagen y actualice su valor
                ous.write(datoImg);
                datoImg = is.read();
            }
        }catch (Exception e) {
            //si hay falla imprimimos mensaje y retornamos false
            out.println(e.getMessage());
            return false;
        }finally{
            //cerramos los metodos
            ous.flush();
            ous.close();
            is.close();
        }
        //si todo sale bien retornamos true
        return true;
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
