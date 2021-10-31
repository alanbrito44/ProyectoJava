<%-- 
    Document   : ventas
    Created on : 24-oct-2021, 17:53:26
    Author     : KARSA
--%>

<%@page import="com.modelo.CategoriaAutomovilDAO"%>
<%@page import="com.modelo.MarcaDAO"%>
<%@page import="com.modelo.Automovil"%>
<%@page import="com.modelo.CategoriaClienteDAO"%>
<%@page import="com.modelo.CategoriaCliente"%>
<%@page import="com.modelo.Cliente"%>
<%@page import="com.modelo.DetalleVentas"%>
<%@page import="com.modelo.Ventas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.modelo.DetalleVentasDAO"%>
<%@page import="com.modelo.VentasDAO"%>
<%@page import="com.modelo.ClienteDAO"%>
<%@page import="com.modelo.AutomovilDAO"%>
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

<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('../recursos/Multimedia/Imagenes/venta.jpeg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}/index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"></span> <span>Ventas <i class="ion-ios-arrow-forward"></i></span></p>
                <h1 class="mb-3 bread">Ventas</h1>
            </div>
        </div>
    </div>
</section>
                <div class="row">
                    <div class="col-md-12 mx-5 my-2">                       
                        <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#mdlVentas" id="btnEditar">
                            Clientes
                        </button>
                        <button type="button" class="btn btn-danger btn-sm mx-2" data-toggle="modal" data-target="#mdlVehiculos" id="btnEliminar">
                            Vehiculos
                        </button>                   
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="">     
                            <div class="form-group mx-sm-3">
                                <label for="inputUser" >Fecha</label>
                                <input type="txt" class="mx-5 p-2 accionBlog" disabled="true">
                            </div>
                            <div class="form-group mx-sm-3">
                                <label for="inputPass">Factura</label>
                               <input type="txt" class="mx-5 p-2 accionBlog" disabled="true">
                            </div>
                            <div class="form-group mx-sm-3">
                                <label for="inputUser">Codigo Cliente</label> 
                                <input type="txt" class="mx-5 p-2 accionBlog" name="txtCodigo" disabled="true">
                            </div>
                            <div class="form-group mx-sm-3">
                                <label for="inputUser">Cliente</label> 
                                <input type="txt" class="mx-5 p-2 accionBlog" name="txtNombre" disabled="true">
                            </div>
                             <div class="form-group mx-sm-3">
                                <label for="inputUser">Monto</label>
                                 <input type="txt" class="mx-5 p-2 accionBlog" disabled="true">
                            </div>
                            <div class="form-group mx-sm-3">
                                <label for="inputUser">Garantia</label>
                                 <input type="txt" class="mx-5 p-2 accionBlog" >
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mx-2">
                    <div class="col-md-12">
                        <div class="">     
                            <table class="table align-items-center">
                                <thead class="thead-dark">
                                    <tr>
                                        <th>ID</th>
                                        <th>MARCA AUTO</th>
                                        <th>MODELO</th>
                                        <th>PRECIO</th>
                                        <th>CANTIDAD</th>
                                        <th>SUB-TOTAL</th>
                                        <th>ACCIONES</th>
                                    </tr>
                                </thead>
                                <tbody id="facturacion">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
       
                <%@include file="../layout/footer.jsp" %>
                <%!
                    VentasDAO daoVentas = new VentasDAO();
                    DetalleVentasDAO daoDetalle = new DetalleVentasDAO();
                    ClienteDAO daoCliente = new ClienteDAO();
                    AutomovilDAO daoAutomovil = new AutomovilDAO();
                    CategoriaClienteDAO daoCategoriaC = new CategoriaClienteDAO();
                    MarcaDAO daoMarca = new MarcaDAO();
                    CategoriaAutomovilDAO daoCate = new CategoriaAutomovilDAO();
                    ArrayList<Ventas> listaVentas = new ArrayList<>();
                    ArrayList<DetalleVentas> listaDetalle = new ArrayList<>();
                    ArrayList<Cliente>listaCliente = new ArrayList<>();
                    ArrayList<CategoriaCliente>listaCategoriaClientes = new ArrayList<>();
                    ArrayList<Automovil> listaAuto = new ArrayList<>();
                %>

<div class="modal fade" id="mdlVentas" tabindex="-1" role="dialog" aria-labelledby="ModalTabla" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">            
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">REGISTRO DE CLIENTES</h5>
                <div class="d-flex col-sm-4 ml-auto">
                    <a href="clientes.jsp"> <button class="form-control btn btn-outline-success"  src="clientes.jsp" type="submit" value="Nuevo Cliente" name="txtNuevo" />Nuevo Cliente</button>
                </a>
                </div>                
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-dark text-center">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NOMBRE</th>
                            <th>APELLIDO</th>
                            <th>EDAD</th>
                            <th>TELEFONO</th>
                            <th>DIRECCION</th>
                            <th>IDENTIFICACION</th>
                            <th>NIT</th>
                            <th>CATEGORIA</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            listaCliente = daoCliente.mostrarCliente();
                            for (Cliente elem : listaCliente) {
                        %> 
                        <tr>
                            <td class="codigo"><%=elem.getId_cliente()%></td>
                            <td class="nombre"><%=elem.getNombre()%></td>
                            <td><%=elem.getApellido()%></td>
                            <td><%=elem.getEdad()%></td>
                            <td><%=elem.getTelefono()%></td>
                            <td><%=elem.getDireccion()%></td>
                            <td><%=elem.getNumerodeidentidad()%></td>
                            <td><%=elem.getNit()%></td>
                            <td><%=daoCategoriaC.getCategoriaCliente(elem.getId_categoria_cliente()).getNombre_categoria()%></td>
                            <td>
                                <button type="button" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#mdlProductos" id="btnSeleccionar">
                                    Seleccionar
                                </button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="mdlVehiculos" tabindex="-1" role="dialog" aria-labelledby="ModalTabla" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">REGISTROS DE AUTOMOVILES</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-dark text-center">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>MODELO</th>
                            <th>PRECIO</th>
                            <th>PLACA</th>
                            <th>AÑO</th>
                            <th>TRANSMISION</th>
                            <th>PUERTAS</th>
                            <th>KILOMETRAGE</th>
                            <th>COLOR</th>
                            <th>MARCA</th>
                            <th>CATEGORIA</th>
                            <th>IMAGEN</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            listaAuto = daoAutomovil.mostrarAutomovil();
                            for (Automovil elem : listaAuto) {
                        %>
                        <tr>
                            <!--LE AGREGAMOS LA CLASE CON ESE NOMBRE PARA UTILIZARLO EN JQUERY Y ASI SACAR SU VALOR-->
                            <td class="id_auto"><%=elem.getId_automovil()%></td>
                            <td class="modelo_auto"><%=elem.getModelo_automovil()%></td>
                            <td class="precio_auto"><%=elem.getPrecio()%></td>
                            <td class="placa_auto"><%=elem.getPlaca()%></td>
                            <td class="ano_auto"><%=elem.getAno()%></td>
                            <td class="transmision_auto"><%=elem.getTransmision()%></td>
                            <td class="puerta_auto"><%=elem.getPuertas()%></td>
                            <td class="kilometrage_auto"><%=elem.getKilometrage()%></td>
                            <td class="color_auto"><%=elem.getColor()%></td>

                            <td class="marca_auto"><%=daoMarca.getMarca(elem.getId_marca()).getNombre_marca()%></td>

                            <td class="categoria_auto"><%=daoCate.getCategoria(elem.getId_catAutomovil()).getNombre_categoria()%></td>

                            <td class="imagen_auto"><image src="../<%=daoAutomovil.getImagen(elem.getId_automovil()).getImagen_auto()%>" width="50" height="50"/></td>
                            <td>
                                <button type="button" class="btn btn-warning btn-sm" id="btnVehiculo">
                                    Seleccionar
                                </button>
                            </td>
                        </tr>
                        
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
                    <script src="../recursos/JS/ventas.js"></script>