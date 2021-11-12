<%-- 
    Document   : ventas
    Created on : 24-oct-2021, 17:53:26
    Author     : KARSA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@include file="../layout/navbar.jsp" %>

<%    
    if (sesion.getAttribute("nivel") == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }else if ((Integer) sesion.getAttribute("nivel") != 1){
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
%>

<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('../recursos/Multimedia/Imagenes/reportes.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}/index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"></span> <span>Reportes <i class="ion-ios-arrow-forward"></i></span></p>
                <h1 class="mb-3 bread">Reportes</h1>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section ftco-degree-bg">
    <div class="container">
        <div class="row">
            <div class="col-md-12 ftco-animate">
                <h2 class="mb-3">It is a long established fact a reader be distracted</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.</p>


            </div>
        </div>
    </div>
</section>

<%@include file="../layout/footer.jsp" %>