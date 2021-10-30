/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
	$(document).on('click', '.btnSeleccionar', function(){
		var id=$(this).val();
		var first=$('#firstname'+id).text();
		var last=$('#lastname'+id).text();
		var address=$('#address'+id).text();
	
		$('#edit').modal('show');
		$('#efirstname').val(first);
		$('#elastname').val(last);
		$('#eaddress').val(address);
	});
});

