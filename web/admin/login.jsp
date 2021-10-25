<%-- 
    Document   : login
    Created on : 10-25-2021, 10:36:32 AM
    Author     : Karsa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <title>Login 10</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="../recursos/CSS/style-login.css">

    </head>

    <body class="img js-fullheight" style="background-image: url('../recursos/Multimedia/Imagenes/bg_1.jpg');">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Bienvenido a Cars Toreto</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center">Ingresa tu usuario</h3>
                            <form action="${pageContext.request.contextPath}/LoginServlet" method="POST" class="signin-form">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Usuario" name="txtUsuario" required>
                                </div>
                                <div class="form-group">
                                    <input id="password-field" type="password" class="form-control" placeholder="Password"
                                           name="txtClave" required>
                                    <span toggle="#password-field"
                                          class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3" name="btnLogin">Sign In</button>
                                </div>
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="../recursos/JS/jquery.min.js"></script>
        <script src="../recursos/JS/popper.min.js"></script>
        <script src="../recursos/JS/bootstrap.min.js"></script>
        <script src="../recursos/JS/main-login.js"></script>

    </body>

</html>

<%
    //creando variable de sesion
    HttpSession sesion = request.getSession();
    //aqui comprobamos que la variable nivel creada en el controlador LoginServlet tenga un valor
    if (request.getAttribute("nivel") != null) {
        //out.println("respuesta: "+request.getAttribute("clave"));
        //aqui transformamos el objeto a un integrer para poder validar que nive sea diferente a 0 
        if ((Integer) request.getAttribute("nivel") != 0) {

            //aqui cremaos una variable de sesion de nombre usuario y que su valor sera el que tiene 
            //la variable de nombre ususario del controlador LoginServlet
            sesion.setAttribute("usuario", request.getAttribute("usuario"));
            sesion.setAttribute("nivel", request.getAttribute("nivel"));

            //haciendo redireccionamieneto de vista login a vista home cuado se haya comprobado la condicion
            response.sendRedirect("index.jsp");
        }
    }
    //aqui estamos destruyendo las variables de sesion cuando el usuario da click en salir en el navbar
    if (request.getParameter("cerrar") != null) {
        sesion.invalidate();
    }
%>
