<body>
    <%
        HttpSession sesion = request.getSession();
    %>
    <%!
        private String UPLOAD_DIR = "recursos/multimedia/imagenesupload/";
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
                        }else if ((Integer) sesion.getAttribute("nivel") != null) {
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
