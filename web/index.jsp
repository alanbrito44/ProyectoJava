<%-- 
    Document   : index
    Created on : 24-oct-2021, 15:55:40
    Author     : KARSA
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.Marca" %>
<%@page import="com.modelo.MarcaDAO" %>
<%@page import="com.modelo.Automovil" %>
<%@page import="com.modelo.AutomovilDAO" %>
<%@page import="com.modelo.CategoriaAutomovil" %>
<%@page import="com.modelo.CategoriaAutomovilDAO" %>
<%@page import="com.modelo.BlogDescripcionDao"%>
<%@page import="com.modelo.BlogDescripcion"%>
<%@page import="com.modelo.Privilegios"%>
<%@page import="com.modelo.PrivilegiosDAO"%>
<%@page import="com.modelo.Usuario"%>
<%@page import="com.modelo.UsuarioDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Cars Toreto - venta de automoviles</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"  crossorigin="anonymous"/>

        <link rel="stylesheet" href="recursos/CSS/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="recursos/CSS/animate.css">

        <link rel="stylesheet" href="recursos/CSS/owl.carousel.min.css">
        <link rel="stylesheet" href="recursos/CSS/owl.theme.default.min.css">
        <link rel="stylesheet" href="recursos/CSS/magnific-popup.css">

        <link rel="stylesheet" href="recursos/CSS/aos.css">

        <link rel="stylesheet" href="recursos/CSS/ionicons.min.css">

        <link rel="stylesheet" href="recursos/CSS/bootstrap-datepicker.css">
        <link rel="stylesheet" href="recursos/CSS/jquery.timepicker.css">


        <link rel="stylesheet" href="recursos/CSS/flaticon.css">
        <link rel="stylesheet" href="recursos/CSS/icomoon.css">
        <link rel="stylesheet" href="recursos/CSS/style.css">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (request.getParameter("cerrar") != null) {
                sesion.invalidate();
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Cars<span>Toreto</span></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"><a href="${pageContext.request.contextPath}/index.jsp" class="nav-link">Inicio</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/vistas/about.jsp" class="nav-link">Nosotros</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/vistas/cars.jsp" class="nav-link">Carros</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/vistas/blogs.jsp" class="nav-link">Blog</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/vistas/contacto.jsp" class="nav-link">Contacto</a></li>

                        <%
                            if (sesion.getAttribute("nivel") == null) {

                            } else if ((Integer) sesion.getAttribute("nivel") == 1) {
                        %>                  
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/vistas/ventas.jsp" class="nav-link">Venta</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/vistas/reportes.jsp" class="nav-link">Reportes</a></li> 
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/admin/login.jsp?cerrar=true" class="nav-link">Salir</a></li>
                            <%
                            } else if ((Integer) sesion.getAttribute("nivel") != null) {
                            %>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/admin/login.jsp?cerrar=true" class="nav-link">Salir</a></li>
                            <%
                                }
                            %>                  
                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->
        <div class="hero-wrap ftco-degree-bg" style="background-image: url('recursos/Multimedia/Imagenes/bg_2.jpg');" data-stellar-background-ratio="0.5">
            <div class="overlay">
                <%
                    if (sesion.getAttribute("nivel") == null) {

                    } else if ((Integer) sesion.getAttribute("nivel") != null) {
                %> 
                <button type="button" class="btn btn-outline-dark py-3 px-4 mb-lg-5 mb-3" data-toggle="modal" data-target="#modalLogin" data-backdrop="static" data-keyboard="false">
                    Crear usuario
                </button>
                <%
                    }
                %> 
            </div>
            <div class="container">
                <div class="row no-gutters slider-text justify-content-start align-items-center justify-content-center">
                    <div class="col-lg-8 ftco-animate">
                        <div class="text w-100 text-center mb-md-5 pb-md-5">
                            <h1 class="mb-4">Compra rapida y facil de tu automovil</h1>
                            <p style="font-size: 18px;">Somos tu empresa de confianza con la que puedes contar para la compra de tu primer vehiculo, ya sea nuevo modelo o modelos anteriores</p>
                            <a href="https://vimeo.com/45830194" class="icon-wrap popup-vimeo d-flex align-items-center mt-4 justify-content-center">
                                <div class="icon d-flex align-items-center justify-content-center">
                                    <span class="ion-ios-play"></span>
                                </div>
                                <div class="heading-title ml-5">
                                    <span>Easy steps for renting a car</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%!
            MarcaDAO daoMarca = new MarcaDAO();
            ArrayList<Marca> listaMarca = new ArrayList<>();
            AutomovilDAO daoAutomovil = new AutomovilDAO();
            ArrayList<Automovil> listaAuto = new ArrayList<>();
            CategoriaAutomovilDAO daoCate = new CategoriaAutomovilDAO();
            ArrayList<CategoriaAutomovil> listaCate = new ArrayList<>();
            BlogDescripcionDao bdao = new BlogDescripcionDao();
            ArrayList<BlogDescripcion> listaBlogs = new ArrayList<>();
            PrivilegiosDAO daopri = new PrivilegiosDAO();
            ArrayList<Privilegios> listaPri = new ArrayList<>();
            UsuarioDAO daousu = new UsuarioDAO();
            ArrayList<Usuario> listaUsu = new ArrayList<>();
        %>
        <script>
            var accion = "<%=request.getAttribute("action")%>";
            var resultado = <%=request.getAttribute("resultado")%>
        </script>

        <section class="ftco-section ftco-no-pt bg-light">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-12 heading-section text-center ftco-animate mb-5">
                        <span class="subheading">Que te ofrecemos</span>
                        <%
                            if (sesion.getAttribute("usuario") == null) {
                        %> 

                        <%
                        } else if (sesion.getAttribute("usuario") != null) {
                        %> 
                        <h2>Bienvenido <%=sesion.getAttribute("usuario")%></h2>
                        <h2>ID USUARIO <%=sesion.getAttribute("id")%></h2>
                        <%
                            }
                        %> 
                        <h2 class="mb-2">Ultimos vehiculos ingresados</h2>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="carousel-car owl-carousel">
                            <%
                                listaAuto = daoAutomovil.mostrarAutomovilTop();
                                for (Automovil elem : listaAuto) {
                            %>
                            <div class="item">
                                <div class="car-wrap rounded ftco-animate">
                                    <div>
                                        <image class="img rounded d-flex align-items-end" src="<%=daoAutomovil.getImagen(elem.getId_automovil()).getImagen_auto()%>"/>
                                    </div>
                                    <div class="text">
                                        <h2 class="mb-0"><a href="#"><%=elem.getModelo_automovil()%></a></h2>
                                        <div class="d-flex mb-3">
                                            <span class="cat"><%=daoMarca.getMarca(elem.getId_marca()).getNombre_marca()%></span>
                                            <p class="price ml-auto">$<%=elem.getPrecio()%></p>
                                        </div>
                                        <p class="d-flex mb-0 d-block">
                                            <a class="btn btn-primary py-2 mr-1">Stock (<%=elem.getStock()%>)</a> 
                                            <a href="${pageContext.request.contextPath}/vistas/carDetails.jsp?id=<%=elem.getId_automovil()%>" class="btn btn-secondary py-2 ml-1">Detalles</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section ftco-about">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-md-6 p-md-5 img img-2 d-flex justify-content-center align-items-center" style="background-image: url(recursos/Multimedia/Imagenes/about.jpg);">
                    </div>
                    <div class="col-md-6 wrap-about ftco-animate">
                        <div class="heading-section heading-section-white pl-md-5">
                            <h2 class="mb-4">Bienvenido a Cars Toreto</h2>

                            <p>Somos una empresa especialida en la venta de vehiculos nuevos y usados, contamos con un alto catalogo de vehiculos por los cuales puedes elegir.</p>
                            <p>Como empresa estamos comprometidos a brindar el mejor servicio a nuestros clientes, por lo que contamos con garantia en todos nuestros vehiculos, 
                                por lo que nuestro clientes nose deben preocupar por algun desperfecto en los vehiculos usados ya que nos aseguramos de su funcionalidad completa antes de hacer la entrega del vehiculo</p>
                            <p><a href="${pageContext.request.contextPath}/vistas/cars.jsp" class="btn btn-primary py-3 px-4">Buscar un vehiculo</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section testimony-section bg-light">
            <div class="container">
                <div class="row justify-content-center mb-5">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <span class="subheading">Comentarios</span>
                        <h2 class="mb-3">Clientes satisfechos</h2>
                    </div>
                </div>
                <div class="row ftco-animate">
                    <div class="col-md-12">
                        <div class="carousel-testimony owl-carousel ftco-owl">
                            <div class="item">
                                <div class="testimony-wrap rounded text-center py-4 pb-5">
                                    <div class="user-img mb-2" style="background-image: url(recursos/Multimedia/Imagenes/comentario1.jpg)">
                                    </div>
                                    <div class="text pt-4">
                                        <p class="mb-4">Estoy complacida con mi vehiculo, muy atentos siempre en resolver mis dudas sobre el vehiculo.</p>
                                        <p class="name">Isela Zelaya</p>
                                        <span class="position">Cliente Nuevo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap rounded text-center py-4 pb-5">
                                    <div class="user-img mb-2" style="background-image: url(recursos/Multimedia/Imagenes/comentario2.jpg)">
                                    </div>
                                    <div class="text pt-4">
                                        <p class="mb-4">Siempre complacido con el servicio que bridan en cars toreto, recomendados para personas que buscan un vehiculo.</p>
                                        <p class="name">Eduardo Ingles</p>
                                        <span class="position">Cliente frecuente</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap rounded text-center py-4 pb-5">
                                    <div class="user-img mb-2" style="background-image: url(recursos/Multimedia/Imagenes/comentario3.jpg)">
                                    </div>
                                    <div class="text pt-4">
                                        <p class="mb-4">Siempre que alguien me consulta en donde comprar un vehiculo no dudo en recomendar a cars toreto, 100% recomendado su servicio.</p>
                                        <p class="name">Juan Portillo</p>
                                        <span class="position">Cliente frecuente</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap rounded text-center py-4 pb-5">
                                    <div class="user-img mb-2" style="background-image: url(recursos/Multimedia/Imagenes/comentario4.jpg)">
                                    </div>
                                    <div class="text pt-4">
                                        <p class="mb-4">Gracias a cars toreto pude comprar el carro que tanto habia estado buscando, para futuras compras siempre contare con ellos.</p>
                                        <p class="name">Oscar Sanchez</p>
                                        <span class="position">Ciente nuevo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="testimony-wrap rounded text-center py-4 pb-5">
                                    <div class="user-img mb-2" style="background-image: url(recursos/Multimedia/Imagenes/comentario5.jpg)">
                                    </div>
                                    <div class="text pt-4">
                                        <p class="mb-4">Cars toreto siempre ofrece un gran servicio hacia sus clientes, gracias a un conocido los conoci y ahora estoy mas que contento con mi carro.</p>
                                        <p class="name">Claudia Granados</p>
                                        <span class="position">Cliente nuevo</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center mb-5">
                    <div class="col-md-7 heading-section text-center ftco-animate">
                        <span class="subheading">Blogs</span>
                        <h2>Blogs recientes</h2>
                    </div>
                </div>
                <div class="row d-flex">
                    <%
                        listaBlogs = bdao.mostrarBlogRecientes();
                        for (BlogDescripcion elem : listaBlogs) {
                    %>
                    <div class="col-md-4 d-flex ftco-animate">
                        <div class="blog-entry justify-content-end">
                            <a href="vistas/blogContent.jsp?Accion=CargarBlog&id=<%=elem.getIdBlog()%>" class="block-20" style="background-image: url('recursos/Multimedia/ImagenesUpload/<%=elem.getImgPortada()%>');">
                            </a>
                            <div class="text pt-4">
                                <div class="meta mb-3">
                                    <div><a href=""><%=elem.getFecha()%></a></div>
                                    <div><a href=""><%=bdao.usuarioBlog(elem.getIdBlog())%></a></div>
                                </div>
                                <h3 class="heading mt-2"><a href="vistas/blogContent.jsp?Accion=CargarBlog&id=<%=elem.getIdBlog()%>"><%=elem.getTitulo()%></a></h3>
                                <p><a href="vistas/blogContent.jsp?Accion=CargarBlog&id=<%=elem.getIdBlog()%>" class="btn btn-primary">Leer mas</a></p>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </section>	

        <section class="ftco-counter ftco-section img bg-light" id="section-counter">
            <div class="overlay"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                        <div class="block-18">
                            <div class="text text-border d-flex align-items-center">
                                <strong class="number" data-number="60">0</strong>
                                <span>Year <br>Experienced</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                        <div class="block-18">
                            <div class="text text-border d-flex align-items-center">
                                <strong class="number" data-number="1090">0</strong>
                                <span>Total <br>Cars</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                        <div class="block-18">
                            <div class="text text-border d-flex align-items-center">
                                <strong class="number" data-number="2590">0</strong>
                                <span>Happy <br>Customers</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
                        <div class="block-18">
                            <div class="text d-flex align-items-center">
                                <strong class="number" data-number="67">0</strong>
                                <span>Total <br>Branches</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>	
        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2"><a href="#" class="logo">Cars<span>Toreto</span></a></h2>
                            <p>Somos tu empresa de confianza con la que puedes contar para la compra de tu primer vehiculo, ya sea nuevo modelo o modelos anteriores</p>
                            <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4 ml-md-5">
                            <h2 class="ftco-heading-2">Informacion</h2>
                            <ul class="list-unstyled">
                                <li><a href="${pageContext.request.contextPath}/vistas/about.jsp" class="py-2 d-block">Nostros</a></li>
                                <li><a href="${pageContext.request.contextPath}/vistas/cars.jsp" class="py-2 d-block">Carros</a></li>
                                <li><a href="${pageContext.request.contextPath}/vistas/blogs.jsp" class="py-2 d-block">Blogs</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Servicio al cliente</h2>
                            <ul class="list-unstyled">
                                <li><a href="${pageContext.request.contextPath}/vistas/contacto.jsp" class="py-2 d-block">Contactanos</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Tienes preguntas?</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">Col. Escalon, Calle al mirador, San Salvador, El Salvador</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+(503) 2245-8547</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">carstoreto@gmail.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">

                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> pagina creada <i class="icon-heart color-danger" aria-hidden="true"></i> por <a href="#">Alan, Douglas y Javier</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </footer>




        <!-- Modal Tabla categoria -->
        <div class="modal fade" id="modalLogin" tabindex="-1" role="dialog" aria-labelledby="ModalTabla" aria-hidden="true">
            <div class="modal-dialog modal-xl" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Listado usuarios ingresados</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="overflow-x:auto;">
                        <table class="table table-dark text-center">

                            <thead>
                            <th>ID</th>
                            <th>USUARIO</th>
                            <th>NOMBRE</th>
                            <th>APELLIDO</th>
                            <th>PRIVILEGIOS</th>
                            <th>IMAGEN</th>
                            </thead>
                            <tbody>
                                <%
                                    listaUsu = daousu.mostrarUsuario();
                                    for (Usuario elem : listaUsu) {
                                %>
                                <tr>
                                    <td class="id_usuario"><%=elem.getId_usuario()%></td>
                                    <td class="usuario"><%=elem.getUsuario()%></td>
                                    <td class="nombre"><%=elem.getNombre()%></td>
                                    <td class="apellido"><%=elem.getApellido()%></td>
                                    <td class="privilegio"><%=daopri.getPrivilegio(elem.getId_privilegio()).getNombre_privilegio()%></td>
                                    <td class="imagen_usu"><img id="ruta" src="<%=daousu.getImagen(elem.getId_usuario()).getImagen()%>" width="50" height="50"/></td>
                                    <td>
                                        <button type="button" class="btn btn-warning" id="btnEditarU">
                                            <i class="far fa-edit"></i>
                                        </button>
                                        <button type="button" class="btn btn-danger" id="btnEliminarU">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalLoginCrud" id="btnAgregarU">
                            Agregar
                        </button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal crud login-->
        <div class="modal fade" id="modalLoginCrud" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalCenterTitle">Creacion de usuarios</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="UsuarioServlet" method="POST" enctype="multipart/form-data">
                        <div class="modal-body">


                            <input type="hidden" class="form-control" name="txtIdUsuario">
                            Nombre de usuario
                            <input type="text" class="form-control" name="txtUsuario" maxlength="20">
                            Nombre
                            <input type="text" class="form-control" name="txtNombre"  maxlength="20">
                            Apellido
                            <input type="text" class="form-control" name="txtApellido"  maxlength="20">
                            Contrasena
                            <input type="password" class="form-control" name="txtContra"  maxlength="20">
                            Privilegios
                            <select class="form-control" name="sPrivilegios">
                                <%
                                    listaPri = daopri.mostrarPrivilegis();
                                    //FOREACH PARA GENERAR EL SELECT CON TODOS LOS DATOS QUE SE ENCUENTRAN EN EL ARRAYLIST
                                    for (Privilegios elem : listaPri) {
                                %>
                                <option value="<%=elem.getId_privilegios()%>"><%=elem.getNombre_privilegio()%></option>
                                <%
                                    }
                                %>
                            </select>
                            Imagen
                            <input type="file" class="form-control" name="txtImagenUsu">
                            <input type="hidden" class="form-control" name="txtRutaImg">

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" name="accion" value="agregar">Agregar</button>
                            <button type="submit" class="btn btn-warning" name="accion" value="editar">Editar</button>
                            <button type="submit" class="btn btn-danger" name="accion" value="eliminar">Eliminar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>                    


        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


        <script src="recursos/JS/jquery.min.js"></script>
        <script src="recursos/JS/jquery-migrate-3.0.1.min.js"></script>
        <script src="recursos/JS/popper.min.js"></script>
        <script src="recursos/JS/bootstrap.min.js"></script>
        <script src="recursos/JS/jquery.easing.1.3.js"></script>
        <script src="recursos/JS/jquery.waypoints.min.js"></script>
        <script src="recursos/JS/jquery.stellar.min.js"></script>
        <script src="recursos/JS/owl.carousel.min.js"></script>
        <script src="recursos/JS/jquery.magnific-popup.min.js"></script>
        <script src="recursos/JS/aos.js"></script>
        <script src="recursos/JS/jquery.animateNumber.min.js"></script>
        <script src="recursos/JS/bootstrap-datepicker.js"></script>
        <script src="recursos/JS/jquery.timepicker.min.js"></script>
        <script src="recursos/JS/scrollax.min.js"></script>
        <script src="recursos/JS/main.js"></script>
        <script src="recursos/JS/usuarios.js"></script>
        <script src="recursos/JS/loginAlerts.js"></script>

    </body>
</html>
