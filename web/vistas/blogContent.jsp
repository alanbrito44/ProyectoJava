<%-- 
    Document   : blogContent
    Created on : 24-oct-2021, 16:44:51
    Author     : KARSA
--%>

<%@page import="com.modelo.Categoria"%>
<%@page import="com.modelo.BlogDescripcion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.BlogDescripcionDao"%>
<%@page import="com.modelo.Privilegios"%>
<%@page import="com.modelo.PrivilegiosDAO"%>
<%@page import="com.modelo.Usuario"%>
<%@page import="com.modelo.UsuarioDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@include file="../layout/navbar.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/recursos/CSS/blogStyle.css">

<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('../recursos/Multimedia/Imagenes/bg_3.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}/index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a href="${pageContext.request.contextPath}/vistas/blogs.jsp">Blog <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog Single <i class="ion-ios-arrow-forward"></i></span></p>
                <h1 class="mb-3 bread">Read our blog</h1>
            </div>
        </div>
    </div>
</section>

<%    BlogDescripcionDao bdao = new BlogDescripcionDao();
    ArrayList<BlogDescripcion> listaBlogs = new ArrayList<>();
    ArrayList<BlogDescripcion> listaBlogs2 = new ArrayList<>();
%>

<section class="ftco-section ftco-degree-bg">
    <div class="container">
        <div class="row">
            <%
                listaBlogs = bdao.mostrarBlogsId(Integer.parseInt(request.getParameter("id")));

                for (BlogDescripcion elem : listaBlogs) {
            %>
            <div class="col-md-8 ftco-animate">
                <h2 class="mb-3"><%=elem.getTitulo()%></h2>
                <p>
                    <img src="../recursos/Multimedia/ImagenesUpload/<%=elem.getImgPortada()%>" alt="" class="img-fluid">
                </p>
                <p><%=elem.getContenido()%></p>

                <div class="tag-widget post-tag-container mb-5 mt-5">
                    <div class="tagcloud">
                        <spam id="categoriaBlog" class="bg-success text-white p-1 mx-1"><%=bdao.cargarCategoria(elem.getIdCat())%></spam>
                    </div>
                </div>
                <%
                    sesion.getAttribute("id");
                    UsuarioDAO daousu = new UsuarioDAO();
                    ArrayList<Usuario> listaUsu = new ArrayList<>();
                    listaUsu = daousu.mostrarUsuario();
                    for (Usuario elem3 : listaUsu) {
                %>
                <div class="about-author d-flex p-4 bg-light">
                    <div class="bio mr-5">
                        <img src="../<%=daousu.getImagen(elem3.getId_usuario()).getImagen()%>" class="img-fluid mb-4">
                    </div>
                    <div class="desc">
                        <h3><%=elem3.getNombre()%> <%=elem3.getApellido()%></h3>
                        <p>Gracias por entrar al blog, esperamos que haya sido de tu agrado la informacion que hemos compartido contigo, si quieres ver mas contenido no dudes en
                        ver los otros blogs, que tenemos para ti.</p>
                        
                    </div>
                </div>
                <%
                    }
                %>
                <p><a href="${pageContext.request.contextPath}/vistas/blogs.jsp" class="btn btn-primary mt-3">
                        <span class="icon-long-arrow-left"></span>
                        Regresar A La Lista De Blogs
                    </a>
                </p>
            </div> <!-- .col-md-8 -->
            <%
                }
            %>

            <div class="col-md-4 sidebar ftco-animate">

                <div class="sidebar-box ftco-animate">

                    <h3>Blogs recientes</h3>
                    <%
                        listaBlogs2 = bdao.mostrarBlogRecientes();
                        for (BlogDescripcion elem2 : listaBlogs2) {
                    %>
                    <div class="block-21 mb-4 d-flex">
                        <a class="blog-img mr-4" style="background-image: url('../recursos/Multimedia/ImagenesUpload/<%=elem2.getImgPortada()%>');"></a>
                        <div class="text">
                            <h3 class="heading"><a href="#"><%=elem2.getTitulo()%></a></h3>
                            <div class="meta">
                                <div><a href="#"><span class="icon-calendar"></span> <%=elem2.getFecha()%></a></div>
                                <div><a href="#"><span class="icon-person"></span> <%=bdao.usuarioBlog(elem2.getIdBlog())%></a></div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>


                <div class="sidebar-box ftco-animate">
                    <h3>Seccion de blogs</h3>
                    <p>En este apartado podras encotrar diferentes blogs creados por nuestro personal, en el cual podras disfrutar de diferente contenido de tu gusto. Esperamos que sea 
                        de tu agrado el contenido que compartimos contigo</p>
                </div>
            </div>

        </div>
    </div>
</section> <!-- .section -->

<%@include file="../layout/footer.jsp" %>