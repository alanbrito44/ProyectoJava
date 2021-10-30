/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
    $('body').on('click', '#btnEliminar', function(){
       let fila = $(this).closest('tr');
       llenarFormulario(fila);
       $('button[name=btnAgregar]').hide();
       $('button[name=btnEditar]').hide();
       $('button[name=btnEliminar]').show();
    }); 
    
    $('body').on('click', '#btnEditar', function(){
        let fila = $(this).closest('tr');
        llenarFormulario(fila);
        $('button[name=btnAgregar]').hide();
       $('button[name=btnEditar]').show();
       $('button[name=btnEliminar]').hide();
    });
    
    $('#btnAgregar').click(function(){
       $('form')[0].reset(); 
       $('button[name=btnAgregar]').show();
       $('button[name=btnEditar]').hide();
       $('button[name=btnEliminar]').hide();
    });
    
    function llenarFormulario(fila){
        var id = fila.find('.id').text();
        var nombre = fila.find('.nombre').text();
        var apellido = fila.find('.apellido').text();
        var edad = fila.find('.edad').text();
        var telefono = fila.find('.telefono').text();
        var direccion = fila.find('.direccion').text();
        var identidad = fila.find('.identidad').text();
        var nit = fila.find('.nit').text();
        var categoria = fila.find('.categoria').text();
        
        $('input[name=txtid]').val(id);
        $('input[name=txtNombre]').val(nombre);
        $('input[name=txtapellido]').val(apellido);
        $('input[name=txtedad]').val(edad);
        $('input[name=txtTelefono]').val(telefono);
        $('input[name=txtDireccion]').val(direccion);
        $('input[name=txtidentidad]').val(identidad);
        $('input[name=txtnit]').val(nit);
        $('select[name=sCategoria]').find('option:contains('+categoria+')').prop('selected', true);
    }
});

