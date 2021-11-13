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
import com.modelo.CategoriaDao;
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
import javax.swing.JOptionPane;

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
                        boolean resps = blogDescDao.insertarBlog(blogModel);
                        if(resps){

                            String action = "Crear Blog";
                            request.setAttribute("action",action);
                            request.setAttribute("resultado", resps);
                            request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                        }else{
                            String action = "Crear Blog";
                            request.setAttribute("action",action);
                            request.setAttribute("resultado", resps);
                            request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                        }
                    }else{
    
                            String action = "Subir Imagen";
                            request.setAttribute("action",action);
                            request.setAttribute("resultado", resp);
                            request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                    }
                   }else{
                            String action = "Seleccionar Imagen";
                            request.setAttribute("action",action);
                            request.setAttribute("resultado", false);
                            request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                   }      
                  break;
              case "Eliminar":
                  int id = Integer.parseInt(request.getParameter("actionId"));

                  BlogDescripcionDao bdo = new BlogDescripcionDao();
                  if (bdo.eliminarBlogContenido(id)) {
                      BlogDao bdao = new BlogDao();
                      if (bdao.eliminarBlog(id)) {
                          String i = request.getParameter("imagen");
                          boolean delImg= eliminarFichero(request.getServletContext().getRealPath("") + UPLOAD_DIR + i);
                          if (delImg) {
                            String action = "Eliminar Entrada";
                            request.setAttribute("action",action);
                            request.setAttribute("resultado", delImg);
                            request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                          } else {
                            String action = "Eliminar Imagen";
                            request.setAttribute("action",action);
                            request.setAttribute("resultado", delImg);
                            request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                          }

                      } else {
                            String action = "Eliminar Blog";
                            request.setAttribute("action",action);
                            request.setAttribute("resultado", false);
                            request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                      }
                  } else {
                            String action = "Eliminar Entrada";
                            request.setAttribute("action",action);
                            request.setAttribute("resultado", false);
                            request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
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
                    String imagenActual = request.getParameter("nombreImgActual");

                    if (nombreImagen.length() > 0) {
                        Part imagenBlog = request.getPart("imgDescripcion");
                        InputStream isBlog = imagenBlog.getInputStream();

                     boolean subidaFile = subirImagen(nombreImagen, isBlog);
                        if (subidaFile) {
                            boolean delImg = eliminarFichero(request.getServletContext().getRealPath("") + UPLOAD_DIR + imagenActual);
                            if (!delImg) {
                                String action = "EliminarImgOld";
                                request.setAttribute("action", action);
                                request.setAttribute("resultado", delImg);
                                request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);

                            } else {
                                BlogDao bdao = new BlogDao();
                                if (bdao.modificarBlog(codigoBlog, codigoUsuario)) {
                                    Calendar fecha = new GregorianCalendar();

                                    //obtenemos el día del mes
                                    int dia = fecha.get(Calendar.DAY_OF_MONTH);
                                    //obtenemos el mes del año
                                    int mes = fecha.get(Calendar.MONTH);
                                    //obtenemos el año
                                    int año = fecha.get(Calendar.YEAR);
                                    String fechaActual = String.valueOf(dia) + "/" + String.valueOf(mes) + "/" + String.valueOf(año);

                                    BlogDescripcion b = new BlogDescripcion();
                                    b.setTitulo(tituloBlog);
                                    b.setImgPortada(nombreImagen);
                                    b.setDescrip(descripcionBlog);
                                    b.setContenido(contenidoBlog);
                                    b.setFecha(fechaActual);
                                    b.setIdCat(codigoCategoria);
                                    b.setIdBlog(codigoBlog);

                                    BlogDescripcionDao bd = new BlogDescripcionDao();
                                    if (bd.modificarBlogImg(b)) {
                                        String action = "Editar Entrada";
                                        request.setAttribute("action",action);
                                        request.setAttribute("resultado", true);
                                        request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                                    }else{
                                        out.println("<script type=\"text/javascript\">");
                                        String action = "Editar Entrada";
                                        request.setAttribute("action",action);
                                        request.setAttribute("resultado", false);
                                        request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                                    }
                                }else{
                                    String action = "EditarUsuarioEntrada";
                                    request.setAttribute("action",action);
                                    request.setAttribute("resultado", false);
                                    request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                                }
                            }
                        } else {
                            String action = "SubirImgEdit";
                            request.setAttribute("action",action);
                            request.setAttribute("resultado", false);
                            request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                        }
                    } else {
                        out.println("llego sin imagen");
                    }

                    break;
                case "newCat":
                    String nombreCat = request.getParameter("txtNombreCat");
                    CategoriaDao cat = new CategoriaDao();
                    
                    if(cat.insertarCat(nombreCat)){
                            String action = "CrearCat";
                            request.setAttribute("action",action);
                            request.setAttribute("resultado", true);
                            request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                    }else{
                            String action = "CrearCat";
                            request.setAttribute("action",action);
                            request.setAttribute("resultado", false);
                            request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                    }
                break;
                case "modCat":
                    String nombCat = request.getParameter("txtNombreCat");
                    int idCat = Integer.parseInt(request.getParameter("txtCodCat"));
                    CategoriaDao cats = new CategoriaDao();
                    
                    if(cats.editarCat(nombCat,idCat)){
                            String action = "ModCat";
                            request.setAttribute("action",action);
                            request.setAttribute("resultado", true);
                            request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                    }else{
                            String action = "ModCat";
                            request.setAttribute("action",action);
                            request.setAttribute("result", false);
                            request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                    }
                break;
                case "delCat":
                    
                    int idCats = Integer.parseInt(request.getParameter("txtCodCat"));
                    CategoriaDao catsd = new CategoriaDao();
                    boolean rs = catsd.delCat(idCats);
 
                     String action = "DelCat";
                     request.setAttribute("action",action);
                     request.setAttribute("resultado", rs);
                     request.getRequestDispatcher("vistas/blogs.jsp").forward(request, response);
                   
                    
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
    private boolean subirImagen(String imgNombre, InputStream is) throws FileNotFoundException, IOException {
        //creamos el directorio donde se va a subir la imagen
        String uploadPath = getServletContext().getRealPath("") + "\\" + File.separator + UPLOAD_DIR + "\\";
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
        } catch (Exception e) {
            //si hay falla imprimimos mensaje y retornamos false
            out.println(e.getMessage());
            return false;
        } finally {
            //cerramos los metodos
            ous.flush();
            ous.close();
            is.close();
        }
        //si todo sale bien retornamos true
        return true;
    }
    public boolean eliminarFichero(String path) {
        File fichero = new File( path);
        
        try {
            if (!fichero.exists()) {
            return false;

        } else {
            fichero.delete();
            return true;
            
        }
        } catch (Exception e) {
            out.println("<script>alert('"+e.getMessage()+"')</script>");
            return false;
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
