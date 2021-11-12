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
        <%
           BlogDescripcionDao bdao = new BlogDescripcionDao();
           ArrayList<BlogDescripcion> listaBlogs=  new ArrayList<BlogDescripcion>();
           listaBlogs = bdao.mostrarBlogsId(Integer.parseInt(request.getParameter("id")));
           
           
           
           for (BlogDescripcion elem : listaBlogs) {
         %>
<section class="ftco-section ftco-degree-bg">
    <div class="container">
        <div class="row">
            <div>
                <p><a href="${pageContext.request.contextPath}/vistas/blogs.jsp" class="btn btn-primary">
                        <span class="icon-long-arrow-left"></span>
                        Regresar A La Lista De Blogs
                    </a>
                </p>
            </div>
            <div class="col-md-12 ftco-animate">
                <h2 class="mb-3"><%=elem.getTitulo()%></h2>
                <p>
                    <%=elem.getDescrip()%>
                </p>
                 <spam class="bg-success text-white p-1 mx-1">
                        <%=bdao.cargarCategoria(elem.getIdCat())%>
                </spam>
                <p>
                    <img class="imgCenter" src="../recursos/Multimedia/ImagenesUpload/<%=elem.getImgPortada()%>" alt="" class="img-fluid">
                </p>
                <div class="my-5">
                    <%=elem.getContenido()%>
                </div>
                <div>
                    <p class="text-center"><a href="${pageContext.request.contextPath}/vistas/blogs.jsp" class="btn btn-primary">
                            <span class="icon-long-arrow-left"></span>
                            Regresar A La Lista De Blogs
                        </a>
                    </p>
                </div>
                    <%
                        }
                    %>

            </div>

        </div>
    </div>
</section> <!-- .section -->

<%@include file="../layout/footer.jsp" %>