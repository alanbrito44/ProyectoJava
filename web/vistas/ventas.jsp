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
    VentasDAO daoVentas = new VentasDAO();
    
    if (sesion.getAttribute("nivel") == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }else if ((Integer) sesion.getAttribute("nivel") != 1){
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/recursos/CSS/ventasStyle.css">
<section class="hero-wrap hero-wrap-2 js-fullheight secc" style="background-image: url('../recursos/Multimedia/Imagenes/venta.jpeg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
                <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}/index.jsp">Home <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"></span> <span>Ventas <i class="ion-ios-arrow-forward"></i></span></p>
                <h1 class="mb-3 bread">Ventas</h1>
            </div>
        </div>
                
                <style>
                    @media print{
                        .btn, .bread, .accion, .secc, .footer{
                            display: none;
                        }
                        input{
                            border: none;
                            background: fff;
                        }
                        td, input{
                            border: none;
                            background: fff;                            
                        }
                    }
                </style>
    </div>
</section>
                <form action="${pageContext.request.contextPath}/VentasController" method="POST">   
                    <br><br
                    <div class="align-content-center">
                        <center>
                        <h5><b>Nombre de La Empresa:</b>           CarsToreto S.A de C.V</h5>
                        <h5><b>Nit de La Empresa:</b>              0513-161220-103-2</h5>
                        <h5><b>Registro de La Empresa:</b>         258925-6</h5>
                        <h5><b>Direccion de La Empresa:</b>        San salvador</h5>
                        </center>
                        </div>
                    <br><br>
                    <div class="row">
                        <div class="col-md-12 mx-5 my-2">                       
                            <button type="button" class="btn btn-success btn-sm" id="btnEditar">
                                Clientes
                            </button>
                            <button type="button" class="btn btn-danger btn-sm mx-2" data-toggle="modal" data-target="#mdlVehiculos" id="btnEliminar">
                                Vehiculos
                            </button>                   
                        </div>
                    </div>
                    <div class="form-group" style="inline-box-align: ">                        
                        <div >
                            <div class="d-flex align-items-center align-content-center">  
                                <div class="col-sm-12 d-flex">
                                    <div class="form-group col-sm-6" style="display: inline-table">                                        
                                        <label for="inputUser" >Fecha</label>
                                        <input  type="txt" class="mx-5 p-2 factura" id="txtFecha" name="txtFecha" disabled="true" >                                       
                                    </div>
                                    <div class="form-group col-sm-6" style="display: inline-table">
                                        <label for="inputPass">Factura</label>
                                        <p class="d-none" id="factnumber"><%=daoVentas.generarFactura()%></p>
                                        <input value="" id="factura" type="txt" class="mx-5 p-2 accionBlog" name="txtFactura" disabled="true">
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex align-items-center align-content-center">
                                <div class="col-sm-12 d-flex">
                                    <div class="form-group col-sm-6" style="display: inline-table">
                                        
                                        <label for="inputUser">Codigo Cliente</label>
                                        <input type="txt" class="mx-5 p-2 accionBlog" name="txtCodigo" disabled="true">
                                        
                                    </div>
                                    <div class="form-group col-sm-6" style="display: inline-table">
                                        <label for="inputUser">Cliente</label> 
                                        <input  type="txt" class="mx-5 p-2 accionBlog" name="txtNombre" disabled="true">
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                    </div>
             
                    <div class="row mx-2">
                        <div class="col-md-12">
                            <div class="">     
                                <table id="venta" class="table align-items-center">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>ID</th>
                                            <th>MARCA AUTO</th>
                                            <th>MODELO</th>
                                            <th>GARANTIA</th>
                                            <th>PRECIO</th>
                                            <th>CANTIDAD</th>
                                            <th>SUB-TOTAL</th>
                                            <th class="accion">ACCIONES</th>
                                        </tr>
                                    </thead>
                                    <tbody id="facturacion" name="facturacion">
                                    </tbody> 
                                    <tfoot>
                                        <tr>
                                            <td><label>Total de Items:</label></td>
                                            <td class="d-flex align-items-center"><input  name="totalItems" type="number" id="totalItems" size="6" value="0"  disabled="true"/></td>
                                            <td><label>Total:</label></td>
                                            <td class="d-flex align-items-center"><input  name="total" type="number" id="total" size="6" value="0"  disabled="true"/></td>
                                            
                                        </tr>
                                    </tfoot>
                                </table>
                                
                                <div class="row">
                                    <div class="col-md-12 mx-5 my-2">                       
                                        <button type="submit" value="crearVenta" class="btn btn-success btn-sm"  name="btnGenerar" id="btnGenerar">
                                            Generar Venta
                                        </button>
                                        <button type="button" class="btn btn-danger btn-sm mx-2" name="btnCancelar" id="btnCancelar">
                                            Cancelar Venta
                                        </button>                   
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
       
                <span class="footer">         <%@include file="../layout/footer.jsp" %></span>
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
                            <th>AÑO</th>
                            <th>PUERTAS</th>
                            <th>KILOMETRAGE</th>
                            <th>COLOR</th>
                            <th>MARCA</th>
                            <th>CATEGORIA</th>
                            <th>GARANTIA</th>
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
                            <td class="ano_auto"><%=elem.getAno()%></td>
                            <td class="puerta_auto"><%=elem.getPuertas()%></td>
                            <td class="kilometrage_auto"><%=elem.getKilometrage()%></td>
                            <td class="color_auto"><%=elem.getColor()%></td>

                            <td class="marca_auto"><%=daoMarca.getMarca(elem.getId_marca()).getNombre_marca()%></td>

                            <td class="categoria_auto"><%=daoCate.getCategoria(elem.getId_catAutomovil()).getNombre_categoria()%></td>

                            <td class="garantia"><%=elem.getGarantia()%></td>
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