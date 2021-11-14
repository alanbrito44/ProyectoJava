<%-- 
    Document   : contacto
    Created on : 24-oct-2021, 16:09:01
    Author     : KARSA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../layout/header.jsp" %>
<%@include file="../layout/navbar.jsp" %>
<style>
    .bar{
        background: green;
        max-width: 60px;
        font-size: 20px;
        color:white;
        overflow: hidden;

    }
</style>
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('../recursos/Multimedia/Imagenes/contaco.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}/index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Contact <i class="ion-ios-arrow-forward"></i></span></p>
                <h1 class="mb-3 bread">Contact Us</h1>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section contact-section">
    <div class="container">
        <div class="row d-flex mb-5 contact-info">
            <div class="col-md-4">
                <div class="row mb-5">
                    <div class="col-md-12">
                        <div class="border w-100 p-4 rounded mb-2 d-flex">
                            <div class="icon mr-3">
                                <span class="icon-map-o"></span>
                            </div>
                            <p><span>Address:</span> San salvador, Las Cascadas</p>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="border w-100 p-4 rounded mb-2 d-flex">
                            <div class="icon mr-3">
                                <span class="icon-mobile-phone"></span>
                            </div>
                            <p><span>Phone:</span> <a href="tel://1234567920">+ 503 2355 2598</a></p>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="border w-100 p-4 rounded mb-2 d-flex">
                            <div class="icon mr-3">
                                <span class="icon-envelope-o"></span>
                            </div>
                            <p><span>Email:</span> <a href="mailto:info@yoursite.com">info@carstoreto.com</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8 block-9 mb-md-5">
                <form action="#" class="bg-light p-5 contact-form">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Tu Nombre" id="name" >
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" placeholder="Tu Correo" id="correo" >
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Asunto" >
                    </div>
                    <div class="form-group">
                        <textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message" ></textarea>
                    </div>
                     <div   class = "progreso"> 
                    <div class="form-group">
                        <input  class="btn btn-outline-dark py-3 px-5" type="submit" value="Enviar Mensaje">
                    </div>
                </form>

            </div>
        </div>
    </div>
</section>
<script>
    $(document).ready(function () {
        $("form").submit(function (e) {
            e.preventDefault();
            var correo = $("#correo").val();
            var nombre = $("#name").val();

            let timerInterval
            Swal.fire({
                title: 'Comprobando Información',
                 html:'<h4 id="bar" class="bar"></h4>',
            }).then((result) => {
                /* Read more about handling dismissals below */

            })

        });
    });
</script>
<%@include file="../layout/footer.jsp" %>
