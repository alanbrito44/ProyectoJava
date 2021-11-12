/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
   $('body').on('click', '#btnSeleccionar', function (){
       let campo = $(this).closest('tr');
        llamarDatos(campo);
        
        $('#mdlVentas').modal('hide');
       
   })
   
   $('body').on('click', '#btnVehiculo', function (){
       let campo = $(this).closest('tr');
        llamarCarros(campo);
        
        $('#mdlVehiculos').modal('hide');
   })
   
   $('body').on('change', '#cantidad', function (){
       let fila = $(this).closest('tr');
       
       var precio = fila.find('#precio').text();
       var cantidad = fila.find('#cantidad').val();
       var subTotal = precio * cantidad;
       fila.find('#subTotal').text(subTotal);
       
       
       
       
     
   })
   
    function llamarCarros(fila){
        var codigo = fila.find('.id_auto').text();
        var marca = fila.find('.marca_auto').text();
        var modelo = fila.find('.modelo_auto').text();
        var precio = fila.find('.precio_auto').text();
        var subTotal = precio * 1; 
        
        
        var tr = '<tr>'+
         '<td>'+codigo+'</td>'+
         '<td>'+marca+'</td>'+
         '<td>'+modelo+'</td>'+
         '<td id="precio">'+precio+'</td>'+
         '<td><input type="number" min="0" value="1" style=" width: 120px;" id="cantidad" class="form-control" name="txtCantidad"></td>'+                
         '<td id="subTotal">'+subTotal+'</td>'+
         '<td>'+
              '<button type="button" class="btn btn-warning btn-sm"  id="btnBorrar">'+
                'Eliminar'+
              '</button>'+
        '</td>'+
                '</tr>';
 
         $('#facturacion').append(tr);
    
      
    }
    function llamarDatos(fila){
        var codigo = fila.find('.codigo').text();
        var nombre = fila.find('.nombre').text();
        
        $('input[name=txtCodigo]').val(codigo);
        $('input[name=txtNombre]').val(nombre);
    }
});