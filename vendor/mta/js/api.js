var id_caso = $("#id_caso_optimizacion").val();
var id_usuario_actividad = $("#id_usuario_actividad").val();
var email_usuario = $("#email_usuario").val();

$('#datatable-default').dataTable( {
	"order": [], 
	"pageLength": 25
});	

$(document).keyup(function(event){

	if(event.which==27)
	{   
	   	if($('#Modal_caso_optimizacion').hasClass('modal fade in'))
	   	{
	   		$('#Modal_caso_optimizacion').modal('hide'); 
	   	}
	}
});
	
$("#btnEditarCasoOptimizacion").click(function() {
	
	if(validar_modal_caso())
	{
		if(!false)
		{
			$("#form-modal-caso-optimizcion").submit();
		}
		
	}
});

$("#btn_editar_caso_optimizacion_1").click(function() {
	
	abrir_modal_caso();
});

$("#btn_ejecutar_caso_1").click(function() {
	
	if(!false)
	{
		hora_actual();
		registrar_actividad(id_usuario_actividad,"Ejecuta caso (ID "+id_caso+")" );
		var caja_json_entrada = $("#codemirror_js_code_1 .CodeMirror-code pre").text(); 
		
		$.ajax({
      		url: "https://compute.scipion.cl/servlet/apimot",
          	method: "POST",
          	data: {string_json_entrada:caja_json_entrada},
          	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
          	dataType : "JSON",
          	success: function(datos)
          	{
          		limpiar_datos_ajax();
          		var string_json_salida = JSON.stringify(datos);
            		
            	if(datos.estado != undefined)
          			$("#estado_ajax").text(datos.estado);		

               	string_json_salida = string_json_salida.replace(/\{/g, "{\n");
            	string_json_salida = string_json_salida.replace(/\,/g,',\n');
            	string_json_salida = string_json_salida.replace(/\}/g, "\n}");
            	
            	$("#codemirror_js_code_2 .CodeMirror-code pre").text(string_json_salida);
            	
            	enviar_datos_api_bbdd(id_caso,caja_json_entrada,datos.estado,null,null,null,string_json_salida);
          	},
          	error:function (response)
 		    {
         	    var msj_error = {};
         	    msj_error["estado"]  = "error";
         	    msj_error["mensaje"] = "Servidor no disponible";
         	    msj_error["soporte"] = "fatapia@scipion.cl";
         	    var string_json_error = JSON.stringify(msj_error);
         	    
         	    string_json_error = string_json_error.replace(/\{/g, "{\n   ");
         	    string_json_error = string_json_error.replace(/\,/g, ",\n   ");
         	    string_json_error = string_json_error.replace(/\}/g, "\n}");
  			    $("#codemirror_js_code_2 .CodeMirror-code pre").text(string_json_error);
  		    }
    	});
	}
});



$("#btn_ver_json_caso").click(function() {
	
	registrar_actividad(id_usuario_actividad,"Resultado el caso (ID "+id_caso+")" );
	enviar_datos_api("resultado",id_caso,email_usuario);
});


$("#btn_resultado_caso").click(function() {
	
	registrar_actividad(id_usuario_actividad,"Resultado el caso (ID "+id_caso+")" );
	enviar_datos_api_ajax("resultado",id_caso,email_usuario);
});

$("#btn_actualizar_caso").click(function() {
		
	registrar_actividad(id_usuario_actividad,"Actualiza el caso (ID "+id_caso+")" );
	enviar_datos_api_ajax("estado",id_caso,email_usuario);
});
	
$("#btn_detener_caso_1").click(function() {
	
	registrar_actividad(id_usuario_actividad,"Detener el caso (ID "+id_caso+")" );
	enviar_datos_api_ajax("detener",id_caso,email_usuario);
});

$("#btn_detener_caso_2").click(function() {
	
	registrar_actividad(id_usuario_actividad,"Detener el caso (ID "+id_caso+")" );
	enviar_datos_api_ajax("detener",id_caso,email_usuario);
});

$("#btn_ver_salida_caso").click(function() {
	
	registrar_actividad(id_usuario_actividad,"Ver salida del caso (ID "+id_caso+")" );
	enviar_datos_api("ver_salida",id_caso,email_usuario);
		
});

$("#btn_ver_datos_caso").click(function() {
	
	registrar_actividad(id_usuario_actividad,"Ver datos del caso (ID "+id_caso+")" );
	enviar_datos_api("ver_datos",id_caso,email_usuario);
		
});


function ejecutarCaso()
{
	var caja_json_entrada = JSON.stringify(Cerebro.plan);

	$.ajax({
     		url: "https://compute.scipion.cl/servlet/apimot",
         	method: "POST",
         	data: {string_json_entrada:caja_json_entrada},
         	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
         	dataType : "JSON",
         	success: function(datos)
         	{
         		console.log(datos);
         	},
         	error:function (response)
		    {
		    	console.log(response);
 		    }
   	});
}

function enviar_datos_api()
{
	var json_entrada = {};
	json_entrada["accion"]  = "ver_salida";
	json_entrada["id_caso"] = parseInt(23);
	json_entrada["usuario"] = "fatapia@scipion.cl";
	
	var string_json_entrada = JSON.stringify(json_entrada);
	console.log(string_json_entrada);

	var salida;

	$.ajax({
	      method: "POST",
	      url: "https://compute.scipion.cl/servlet/apimot",
	      data: { string_json_entrada: string_json_entrada},
	      success: function (response) 
	      {
            salida = response;
          },
          error: function (xhr, status)
          {

          }    
	});

	return salida;
}

function enviar_datos_api_ajax(accion,id_caso,email_usuario) {
	
	var json_entrada = {};
	var datos = "";
	json_entrada["accion"]  = accion;
	json_entrada["id_caso"] = parseInt(id_caso);
	json_entrada["usuario"] = email_usuario;
	
	var string_json_entrada = JSON.stringify(json_entrada);
	$.ajax({
		url: "https://compute.scipion.cl/servlet/apimot",
		method: "POST",
		async: false,
		data: {string_json_entrada: string_json_entrada},
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		dataType: 'JSON',
		success: function (response) 
		{
            datos = response;
        },
        error: function (xhr, status) 
        {
            datos = xhr.responseText;
        }
	});

	return datos;
}

function enviar_datos_api_bbdd(id_caso,json_entrada,estado,tolerancia,margen,duracion,json_salida) {
	

	var data = {
				opcion:'ejecuta_caso',
				id_caso:id_caso,
				json_entrada:json_entrada,
				estado:estado,
				tolerancia:tolerancia,
				margen:margen,
				duracion:duracion,
				json_salida:json_salida
				};
	
	$.ajax({
  		url: "/Servlet/Caso_Optimizacion_Crud",
      	method: "POST",
      	data: data,
      	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
      	dataType : "JSON",
      	success: function(datos)
      	{
//           		if(datos.actualizado != )
//           		{
      			
//           		}
      	},
      	error:function (response)
 		{
  			console.log("¡Error (ajax)!");
  		}	
      	
	}); 

}

function limpiar_datos_ajax() {
	$("#tolerancia_lograda_ajax").text("");
	$("#margen_eficiencia_ajax").text("");
	$("#duracion_ajax").text("");
	$("#estado_ajax").text("");
}

function abrir_modal_caso() {
	
	$("#titulo_caso_optizacion").text("Editar caso");
	$("#opcion").val("editar_caso_optimizacion");
	$("#btnEditarCasoOptimizacion").show();
	$("#btnCrearCasoOptimizacion").hide();
  	$("#Modal_caso_optimizacion").modal({backdrop: "static",show: true}); 
}


function validar_modal_caso()
{
	if($("#nombre_caso").val() == "")
	{
		campo_vacio("#respuesta_nombre_caso");
		return false;
	}
	
	return true;
}
 
function campo_vacio(campo){

	$(campo).show();
	$(campo).closest('.col-sm-7').removeClass('has-success').addClass('has-error');
	$(campo).text('Campo es obligatorio *');
	$(campo.replace('respuesta_','')).focus();
}
  
function limpiar_error(limpiar){
	
	$("#respuesta_"+limpiar).hide();
	$("#respuesta_"+limpiar).closest('.col-sm-7').removeClass('has-error');
	$("#respuesta_"+limpiar).text('');
}
 
 
	if($("#opcion_mensaje").val()=="editar_caso")
{
		var id_caso = $("#id_caso_optimizacion").val();
	var id_usuario_actividad = $("#id_usuario_actividad").val();
	var nombre_caso_optimizacion = $("#nombre_caso_optimizacion").val();
	registrar_actividad(id_usuario_actividad,"Modifica caso: "+nombre_caso_optimizacion +" (ID "+id_caso+")" );
	mensaje_notificacion('Exito','Caso actualizado.','success','fa fa-check');
}   
   
function registrar_actividad(id_usuario,comentario){
	
	if(id_usuario != "")
	{
		$.post("/Servlet/Actividad_Crud", {
			opcion : 'registrar',
			id_usuario : id_usuario,
			comentario : comentario 
		});	
	}	
}

function hora_actual() {
	
	var d = new Date();
	var dia = d.getDate();
	var mes = d.getMonth()+ 1;
	var ano = d.getFullYear();
	var hora = d.getHours();
	var min = d.getMinutes();
	

	if(dia < 10)
	{
		dia = "0"+ dia;
	}
	if(mes < 10)
	{
		mes = "0"+ mes;
	}
	
	if(min < 10)
	{
		min = "0"+ min;
	}
	
	if(hora < 10)
	{
		hora = "0"+ hora;
	}
	
	$("#fecha_actual_ajax").text(dia+"-"+mes+"-"+ano.toString().substring(2, 4)+" " +hora+":"+min);
}

function mensaje_notificacion(titulo,texto,tipo,icono) {
	
	new PNotify({
		title: titulo,
		text: texto,
		type: tipo,
		icon: icono
	});
}

function optimizar()
{
	$('.page-container').pgNotification({
        style: 'simple',
        message: 'Realizando Calculos',
        timeout: 3000,
        type: 'info',
    }).show(); 
    //optimizado
    $.ajax({ 
      type: "get",
      url: "/productivity/json_current",
      data: 'w=2',
      dataType: 'json',
      success: function(data){ 
                fecha = data.dates_week.concat(data.dates_week_2).concat(data.dates_week_3).concat(data.dates_week_4);
                mes = data.spm1;
                // enviando datos de plan de venta 
			    Cerebro.salida = enviar_datos_api_ajax("ver_salida",Cerebro.caso,Cerebro.email);
			    Cerebro.setearResumen();
			    
			    matrizDelta 		  = Cerebro.calcularDelta();
				matrixAlmuerzo 		  = Cerebro.calcularAlmuerzos();
				sum_turnos_real       = Cerebro.totalTurnosReales();
                productividad_diaria  = Cerebro.productividadDiaria();
                productividad_optimizada = Cerebro.productividadOptimizada();
                productividad_objetivo = Cerebro.productividadObjetivo();
                productividad_ideal = Cerebro.productividadIdeal();
			    matrizSemana = Cerebro.calcularPerdida(matrizDelta);
			    resumen_plan = Cerebro.obtenerResumen();
							    	
			    sumatoria_turnos_optimizados = Cerebro.totalTurnosOptimizados();

	
			    initOptimizado = new Array(281);

			    for (var i = 0; i < sum_turnos_real.length; i++) 
			    {
			    	$("#optimo-"+[i+1]).html(sum_turnos_real[i]);
			    }

			    for (var i = initOptimizado.length-1; i >= 0; i--) 
			    {
			    	$("#optimizado-"+[i]).html(sumatoria_turnos_optimizados[i-1]);
			    }

			    for (var i = matrixAlmuerzo.length - 1; i >= 0; i--) 
			    {
			    	if (matrixAlmuerzo[i])
			    	{
			    		$("#optimizado-"+[i]).html($("#optimizado-"+[i]).html()-matrixAlmuerzo[i]);
			    	}
			    }
			    

                 var config = {
                    type: 'line',
                    data: {
                      datasets: [
                                  {data: productividad_diaria, label: 'Productividad/Dotación Actual $CLP', yAxisID: 'left-y-axis', borderColor: 'rgb(153, 102, 255)'},   
                                  {data: productividad_optimizada, label: 'Productividad/Dotación Optimizada $CLP', yAxisID: 'left-y-axis', borderColor: 'rgb(153, 102, 0)'},
                                  {data: productividad_ideal, label: 'Productividad/Dotación Ideal $CLP', yAxisID: 'left-y-axis', borderColor: 'rgb(153, 255, 0)'},
                                  {data: productividad_objetivo, label: 'Productividad/Dotación Objetivo $CLP', yAxisID: 'left-y-axis', borderColor: 'rgb(217, 255, 8)'}
                                  
                                  
                                ],
                      labels: fecha
                    },
                    options: {
                      scales: {
                        yAxes: [{
                          id: 'left-y-axis',
                          type: 'linear',
                          position: 'left'
                        }]
                      }
                    }
                  }    
                 document.getElementById("chartContainer").innerHTML = '&nbsp;';
			     document.getElementById("chartContainer").innerHTML = '<canvas id="canvas"></canvas>';

				 var ctx = document.getElementById("canvas").getContext("2d");
                 var myChart = new Chart(ctx, config);

                 //
                 eficiencia1 = 100-parseFloat(resumen_plan[0].margeAjuste.replace("%", ""));
                 $("#margen-actual").html(eficiencia1+"%");
                 eficiencia2 = 100-parseFloat(resumen_plan[1].margeAjuste.replace("%", ""));
                 $("#margen-optimizado").html(eficiencia2+"%");
				 dotacion_m1 = Calculo.semanal(Cerebro.sumatoriaTurnosOptimizado(), Cerebro.sumatoriaTurnosOptimizado().length);
                 $("#hh-optimizado").html(dotacion_m1);


                  Cerebro.setearTurnos();
                  turnos = Cerebro.turnos;                      
                  num_turnos = Cerebro.plan.datos.num_turnos;
                  count_turnos = 0;
                  while(count_turnos < num_turnos)
                  {
                 	$("#turnos-"+count_turnos).html(turnos[count_turnos+num_turnos].vendedores);
                    count_turnos++;
                  }
                  $('.page-container').pgNotification({
			                style: 'simple',
			                message: 'Calculos realizados',
			                timeout: 3000,
			                type: 'info',
			      }).show(); 
				$("#minutos_optimizando").prop('disabled', false);
				$(".btn-optimize").prop('disabled', false);

      }
    });
    $('#data_opt').slideDown('fast')
    
}

// boton simulación optimizacion

$(document).on('click','.btn-optimize', function()
{
	if ($("#minutos_optimizando").val() !== "")
	{
		Cerebro.brainJson = enviar_datos_api_ajax("resultado", Cerebro.caso, Cerebro.email);
		Cerebro.plan.tiempo_maximo = parseInt($("#minutos_optimizando").val()); 
		Cerebro.plan.id_caso = Cerebro.caso; 
		ejecutarCaso();
		
		$("#minutos_optimizando").prop('disabled', true);
		$(".btn-optimize").prop('disabled', true);

		setTimeout(function()
			{ 
				optimizar(); 
			}, //1000); 
			parseInt(($("#minutos_optimizando").val()+'000')*60)+3000);
	}
	else
	{
		alert("Ingrese minutos de optimización");
	}

});



$(".btn-detalle").on("click", function()
{
	if ($("#detalle-dotacion").css('display') == 'none')
	{
		$("#detalle-dotacion").show();
	}
	else
	{
		$("#detalle-dotacion").hide();
	}
});

