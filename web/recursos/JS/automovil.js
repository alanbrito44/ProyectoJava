/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    
    //aqui le decimos que cuando precionen el boton eliminar buscara el tr mas cercano a ese boton presionado
    //y llamara a la funcion eliminar
    $('body').on('click','#btnEditarA', function(){
       let fila = $(this).closest('tr');
        llenarFormulario(fila);
        $('button[name=btnAgregarA]').hide();
       $('button[name=btnEditarA]').show();
       $('button[name=btnEliminarA]').hide();
    });
    
    $('body').on('click','#btnEliminarA', function(){
       let fila = $(this).closest('tr');
        llenarFormulario(fila);
        $('button[name=btnAgregarA]').hide();
       $('button[name=btnEditarA]').hide();
       $('button[name=btnEliminarA]').show();
    });
    
    $('#btnAgregarA').click(function (){
        //limpiando el formulario
       $('form')[0].reset();
       //ocultando y mostrando botones del modal
       $('button[name=btnAgregarA]').show();
       $('button[name=btnEditarA]').hide();
       $('button[name=btnEliminarA]').hide();
    });
    
    //funcion para llenar le formulario
    function llenarFormulario(fila){
        //la variable tomara el valor, segun el valor de la fila y buscara lo que se encuentre en el id codigo
        //y extraera su texto
        let id_auto = fila.find('.id_auto').text();
        let modelo_auto = fila.find('.modelo_auto').text();
        let precio_auto = fila.find('.precio_auto').text();
        let placa_auto = fila.find('.placa_auto').text();
        let ano_auto = fila.find('.ano_auto').text();
        let transmision_auto = fila.find('.transmision_auto').text();
        let puerta_auto = fila.find('.puerta_auto').text();
        let kilometrage_auto = fila.find('.kilometrage_auto').text();
        let color_auto = fila.find('.color_auto').text();
        let marca_auto = fila.find('.marca_auto').text();
        let categoria_auto = fila.find('.categoria_auto').text();
        let imagen_auto = fila.find('.imagen_auto').text();
        
        //aqui le decimos que al imput con el name txtcodigo, le asignaremos el valor de la variable codigo
        $('input[name=txtIdAutomovil]').val(id_auto);
        $('input[name=txtModelo]').val(modelo_auto);
        $('input[name=txtPrecio]').val(precio_auto);
        $('input[name=txtPlaca]').val(placa_auto);
        $('input[name=txtAno]').val(ano_auto);
        $('input[name=txtTransmision]').val(transmision_auto);
        $('input[name=txtPuerta]').val(puerta_auto);
        $('input[name=txtKilometrage]').val(kilometrage_auto);
        $('input[name=txtColor]').val(color_auto);
        $('select[name=sMarca]').find('option:contains('+marca_auto+')').prop('selected',true);
        $('select[name=sCategoria]').find('option:contains('+categoria_auto+')').prop('selected',true);
    }
});

