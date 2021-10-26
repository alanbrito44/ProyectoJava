/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    
    //aqui le decimos que cuando precionen el boton eliminar buscara el tr mas cercano a ese boton presionado
    //y llamara a la funcion eliminar
    $('body').on('click','#btnEditar', function(){
       let fila = $(this).closest('tr');
        llenarFormulario(fila);
        $('button[name=btnAgregar]').hide();
       $('button[name=btnEditar]').show();
       $('button[name=btnEliminar]').hide();
    });
    
    $('body').on('click','#btnEliminar', function(){
       let fila = $(this).closest('tr');
        llenarFormulario(fila);
        $('button[name=btnAgregar]').hide();
       $('button[name=btnEditar]').hide();
       $('button[name=btnEliminar]').show();
    });
    
    $('#btnAgregar').click(function (){
        //limpiando el formulario
       $('form')[0].reset();
       //ocultando y mostrando botones del modal
       $('button[name=btnAgregar]').show();
       $('button[name=btnEditar]').hide();
       $('button[name=btnEliminar]').hide();
    });
    
    //funcion para llenar le formulario
    function llenarFormulario(fila){
        //la variable tomara el valor, segun el valor de la fila y buscara lo que se encuentre en el id codigo
        //y extraera su texto
        let id_marca = fila.find('.id_marca').text();
        let nombre_marca = fila.find('.nombre_marca').text();
        let descripcion_marca = fila.find('.descripcion_marca').text();
        let pais_marca = fila.find('.pais_marca').text();
        
        //aqui le decimos que al imput con el name txtcodigo, le asignaremos el valor de la variable codigo
        $('input[name=txtIdMarca]').val(id_marca);
        $('input[name=txtMarca]').val(nombre_marca);
        $('textarea[name=txtDescripcion]').val(descripcion_marca);
        $('input[name=txtPais]').val(pais_marca);
    }
});
