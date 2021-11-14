/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {

    //aqui le decimos que cuando precionen el boton eliminar buscara el tr mas cercano a ese boton presionado
    //y llamara a la funcion eliminar
    $('body').on('click', '#btnEditarU', function () {
        Swal.fire({
            title: 'Estas Seguro De editar Esta Entrada?',
            text: "No Podrás Deshacer Los Cambios!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, Editarlo!'
        }).then((result) => {
            if (result.isConfirmed) {
                let fila = $(this).closest('tr');
                llenarFormulario(fila);
                $('button[value="agregar"]').hide();
                $('button[value="editar"]').show();
                $('button[value="eliminar"]').hide();
                //LLAMAMOS AL MODAL
                $("#modalLoginCrud").modal("show");
            }
        })
    });

    $('body').on('click', '#btnEliminarU', function () {
        Swal.fire({
            title: 'Estas Seguro De Eliminar Esta Entrada?',
            text: "No Podrás Deshacer Los Cambios!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, Borrarlo!'
        }).then((result) => {
            if (result.isConfirmed) {
                let fila = $(this).closest('tr');
                llenarFormulario(fila);
                $('button[value="agregar"]').hide();
                $('button[value="editar"]').hide();
                $('button[value="eliminar"]').show();

                //LLAMAMOS AL MODAL
                $("#modalLoginCrud").modal("show");
            }
        })
    });

    $('#btnAgregarU').click(function () {
        //limpiando el formulario
        $('form')[0].reset();
        //ocultando y mostrando botones del modal
        $('button[value="agregar"]').show();
        $('button[value="editar"]').hide();
        $('button[value="eliminar"]').hide();
    });

    //funcion para llenar le formulario
    function llenarFormulario(fila) {
        //la variable tomara el valor, segun el valor de la fila y buscara lo que se encuentre en el id codigo
        //y extraera su texto
        let id_usuario = fila.find('.id_usuario').text();
        let usuario = fila.find('.usuario').text();
        let nombre = fila.find('.nombre').text();
        let apellido = fila.find('.apellido').text();
        let privilegio = fila.find('.privilegio').text();
        let imagen_usu = fila.find('.imagen_usu').children('img').attr('src');

        //aqui le decimos que al imput con el name txtcodigo, le asignaremos el valor de la variable codigo
        $('input[name=txtIdUsuario]').val(id_usuario);
        $('input[name=txtUsuario]').val(usuario);
        $('input[name=txtNombre]').val(nombre);
        $('input[name=txtApellido]').val(apellido);
        $('select[name=sPrivilegios]').find('option:contains(' + privilegio + ')').prop('selected', true);
        $('input[name=txtRutaImg]').val(imagen_usu);
    }
});
