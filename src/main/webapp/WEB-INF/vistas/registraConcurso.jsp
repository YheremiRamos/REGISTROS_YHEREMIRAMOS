<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>YHEREMI RAMOS </title>
</head>
<body>

<div class="container">
<h1>Registra Concurso</h1>

	<form id="id_form"> 
		<div class="row" style="margin-top: 5%">
			<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_nombre">Nombre</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre" maxlength="40">
				</div>
			</div>
			
		</div>
		<div class="row" style="margin-top: 0%">
			
			<div class="form-group  col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_fechaI">Fecha de Inicio</label>
				</div>
				<div class="col-sm-6">
					<input class="form-control" type="date" id="id_fechaI" name="fechaInicio" placeholder="Ingrese la fecha de Inicio" maxlength="100">
		 		</div>
			</div>
			
			<div class="form-group  col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_fechaF">Fecha de Fin</label>
				</div>
				<div class="col-sm-6">
					<input class="form-control" type="date" id="id_fechaF" name="fechaFin" placeholder="Ingrese la fecha de Fin" maxlength="100">
		 		</div>
			</div>
					<div class="form-group col-sm-6">
				<div class="col-sm-4">
					<label class="control-label" for="id_estado">Estado</label>
				</div>
				<div class="col-sm-8">
					<input class="form-control" type="text" id="id_estado" name="estado" placeholder="Ingrese el estado" maxlength="40">
				</div>
			</div>
		</div>
		
		<div class="row" style="margin-top: 2%" align="center"	>
				<button id="id_registrar" type="button" class="btn btn-primary" >Crea Concurso</button>
		</div>	
	</form>
</div>

<script type="text/javascript">

$("#id_registrar").click(function (){ 

	var validator = $('#id_form').data('bootstrapValidator');
    validator.validate();
    
   	if (validator.isValid()){
		$.ajax({
    		type: "POST",
            url: "registraConcurso", 
            data: $('#id_form').serialize(),
            success: function(data){
            	mostrarMensaje(data.MENSAJE);
            	validator.resetForm();
            	limpiarFormulario();
            },
            error: function(){
            	mostrarMensaje(data.MSG_ERROR);
            }
    	});
	}   
    	
	
});


function limpiarFormulario(){
	$('#id_nombre').val('');
	$('#id_fechaI').val('');
	$('#id_fechaF').val('');
	$('#id_estado').val('');
}

$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        		nombre:{
                    selector: "#id_nombre",
                    validators:{
                        notEmpty: {
                             message: 'El nombre es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 40,
                            message: 'El nombre es de 3 a 40 caracteres'
                        },
                    }
                },
                fechaInicio:{
                    selector: "#id_fechaI",
                    validators:{
                        notEmpty: {
                             message: 'La fecha de Inicio es obligatorio'
                        }
                    }
                },
                fechaFinal:{
                    selector: "#id_fechaF",
                    validators:{
                        notEmpty: {
                             message: 'La fecha de Fin es obligatorio'
                        }
                    }
                },
                estado:{
                    selector: "#id_estado",
                    validators:{
                        notEmpty: {
                             message: 'El estado es obligatorio'
                        }
                    }
                }
        }   
    });

    
});
</script>

</body>
</html>




