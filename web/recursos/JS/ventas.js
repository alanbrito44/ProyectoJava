/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    cargarNumFactura();
    
    //Selecciona los Clientes
   $('body').on('click', '#btnSeleccionar', function (){
       let campo = $(this).closest('tr');
        llamarDatos(campo);
        
        $('#mdlVentas').modal('hide');
       
   })
   
   //trae los Vehiculos a la tabla de Facturacion
   $('body').on('click', '#btnVehiculo', function (){
       let campo = $(this).closest('tr');
        llamarCarros(campo);
        
        $('#mdlVehiculos').modal('hide');
   })
   
   //Borra la fila de la compra que no se desee hacer
    $('body').on('click', '#btnBorrar', function (event) {
        const swalWithBootstrapButtons = Swal.mixin({
  customClass: {
    confirmButton: 'btn btn-success',
    cancelButton: 'btn btn-danger'
  },
  buttonsStyling: false
})

swalWithBootstrapButtons.fire({
  title: 'Are you sure?',
  text: "You won't be able to revert this!",
  icon: 'warning',
  showCancelButton: true,
  confirmButtonText: 'Yes, delete it!',
  cancelButtonText: 'No, cancel!',
  reverseButtons: true
}).then((result) => {
  if (result.isConfirmed) {
    swalWithBootstrapButtons.fire(
      'Deleted!',
      'Your file has been deleted.',
      'success'
    )
  } else if (
    /* Read more about handling dismissals below */
    result.dismiss === Swal.DismissReason.cancel
  ) {
    swalWithBootstrapButtons.fire(
      'Cancelled',
      'Your imaginary file is safe :)',
      'error'
    )
  }

        event.preventDefault();
        $(this).closest('tr').remove();
        })
    });
   
    //Limpia todo el Formulario
    $('#btnCancelar').click(function () {
        Swal.fire({
            title: '¿Deseaas Cancelar la Compra?',
            showDenyButton: true,
            confirmButtonText: 'Eliminar?',
        }).then((result) => {
            /* Read more about isConfirmed, isDenied below */
            if (result.isConfirmed) {
                Swal.fire('Compra Cancelada!', '', 'error')
                $("tbody").children().remove()
                $('form')[0].reset();
            } else if (result.isDenied) {
                Swal.fire('Seguir Facturando!', '', 'success')
            }
        })
    });  
    
   
   //Genera la Fecha Automatica
    window.onload = function () {
        var fecha = new Date(); //Fecha actual
        var mes = fecha.getMonth() + 1; //obteniendo mes
        var dia = fecha.getDate(); //obteniendo dia
        var ano = fecha.getFullYear(); //obteniendo año
        if (dia < 10)
            dia = '0' + dia; //agrega cero si el menor de 10
        if (mes < 10)
            mes = '0' + mes //agrega cero si el menor de 10
        document.getElementById('txtFecha').value = dia + "-" + mes + "-" + ano;
    }
    
   // Cuando se Cambia la Cantidad se Cambia el SubTotal   
   $('body').on('change', '#cantidad', function (){
       let fila = $(this).closest('tr');
       
       var precio = fila.find('#precio').text();
       var cantidad = fila.find('#cantidad').val();
       var subTotal = precio * cantidad;
       fila.find('#subTotal').text(subTotal); 
   })
   
   
  //Llenar los datos del pñroducto a Vender (Vehiculos)
    function llamarCarros(fila){
        var codigo = fila.find('.id_auto').text();
        var marca = fila.find('.marca_auto').text();
        var modelo = fila.find('.modelo_auto').text();
        var garantia = fila.find('.garantia').text();
        var precio = fila.find('.precio_auto').text();
        var subTotal = precio * 1; 
        
        
        var tr = '<tr>'+
         '<td class="codigo">'+codigo+'</td>'+
         '<td class="marca">'+marca+'</td>'+
         '<td class="modelo">'+modelo+'</td>'+
         '<td class="garantia">'+garantia+'</td>'+
         '<td class="precio" id="precio">'+precio+'</td>'+
         '<td class="cantidad"><input type="number" min="0" value="1" style="border: none; width: 120px; " id="cantidad" class="form-control" name="txtCantidad"></td>'+                
         '<td class="subtotal" id="subTotal">'+subTotal+'</td>'+
         '<td>'+
              '<button type="button" class="btn btn-warning btn-sm"  id="btnBorrar">'+
                'Eliminar'+
              '</button>'+
        '</td>'+
                '</tr>';
 
         $('#facturacion').append(tr);
         calcularTotal(subTotal);
      
    }
    
    //Llenar los datos del Cliente
    function llamarDatos(fila){
        var codigo = fila.find('.codigo').text();
        var nombre = fila.find('.nombre').text();
        
        $('input[name=txtCodigo]').val(codigo);
        $('input[name=txtNombre]').val(nombre);
    }
        
   
    $('#btnGenerar').click(function(){
       $('form')[0].reset(); 
   })
    
    function generarVenta(fila){
        var id = fila.find('.factura').text();
        var fecha = fila.find('.txtFecha').text();
        var total = fila.find('.total').text();
        var codigo = fila.find('.codigo').text();
        var cliente = fila.find('.codigo').text();
        var auto = fila.find('.id_auto').text();
        var garantia = fila.find('.garantia').text();
        
        $('input[name=txtFactura]').val(id);
        $('input[name=txtFecha]').val(fecha);
        $('input[name=total]').val(total);
        var tr = '<tr>'+
         '<td class="codigo">'+codigo+'</td>'+
         '<td class="garantia">'+garantia+'</td>'+
         '<td class="id_auto">'+auto+'</td>'+
         '<td class=".codigo">'+cliente+'</td>'+
        '</td>'+
                '</tr>';
        
        $('#facturacion').append(tr);
      
    }
    
    $(document).ready(function(){ 
    $('.subTotal').each(function() { 
     calculateSum(); 
    }); 
});
    
    var sum = 0;
// iterate through each td based on class and add the values 
    $(".subTotal").each(function () {

        var value = $(this).text();
        // add only if the value is number 
        if (!isNaN(value) && value.length != 0) {
            sum += parseFloat(value);
        }
    }); 
    
$('#total').text(sum);  

    function cargarNumFactura() {
        var factura = $('#factnumber').text();
        factura++;
        $('#factura').val(factura);
    }
    
    function cargarTotal(){
        $('td.subtotal').each(function (){
            console.log($(this).text());
        });
       
    }
    
    function calcularTotal(){
      var total= 0;
      
      $("#venta >tbody").find("tr").each(function(){
          total += parseFloat($(this).find("td.subtotal").eq(0).text());
          
      })
      
      $("#total").val(total);
    }

    
});