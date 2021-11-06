/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    
    //aqui le decimos que cuando precionen el boton eliminar buscara el tr mas cercano a ese boton presionado
    //y llamara a la funcion eliminar
    $('body').on('click','#btnEditarC', function(){
       let fila = $(this).closest('tr');
        llenarFormulario(fila);
        $('button[name=btnAgregarC]').hide();
       $('button[name=btnEditarC]').show();
       $('button[name=btnEliminarC]').hide();
    });
    
    $('body').on('click','#btnEliminarC', function(){
       let fila = $(this).closest('tr');
        llenarFormulario(fila);
        $('button[name=btnAgregarC]').hide();
       $('button[name=btnEditarC]').hide();
       $('button[name=btnEliminarC]').show();
    });
    
    $('#btnAgregarC').click(function (){
        //limpiando el formulario
       $('form').trigger("reset");
       //ocultando y mostrando botones del modal
       $('button[name=btnAgregarC]').show();
       $('button[name=btnEditarC]').hide();
       $('button[name=btnEliminarC]').hide();
    });
    
    //funcion para llenar le formulario
    function llenarFormulario(fila){
        //la variable tomara el valor, segun el valor de la fila y buscara lo que se encuentre en el id codigo
        //y extraera su texto
        let id_categoria = fila.find('.id_categoria').text();
        let nombre_categoria = fila.find('.nombre_categoria').text();
        let descripcion_categoria = fila.find('.descripcion_categoria').text();
        
        //aqui le decimos que al imput con el name txtcodigo, le asignaremos el valor de la variable codigo
        $('input[name=txtIdCategotria]').val(id_categoria);
        $('input[name=txtCategoria]').val(nombre_categoria);
        $('textarea[name=txtDescripCat]').val(descripcion_categoria);
    }
});

