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
   
    function llamarCarros(fila){
        var codigo = fila.find('.id_auto').text();
        var marca = fila.find('.marca_auto').text();
        var modelo = fila.find('.modelo_auto').text();
        var precio = fila.find('.precio_auto').text();
        
        var tr = '<tr>'+
         '<td>'+codigo+'</td>'+
         '<td>'+marca+'</td>'+
         '<td>'+modelo+'</td>'+
         '<td>'+precio+'</td>'+
         '<td><input type="number" value="1" style=" width: 120px;" id="Cantidad" class="form-control" name="txtCantidad"></td>'+         
         '<td>'+precio*($('#Cantidad').val())+'</td>'+
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
