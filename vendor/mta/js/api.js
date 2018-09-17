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
         	},
         	error:function (response)
		    {
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

      	},
      	error:function (response)
 		{

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
function getQueryVariable(variable) {
   var query = window.location.search.substring(1);
   var vars = query.split("&");
   for (var i=0; i < vars.length; i++) {
       var pair = vars[i].split("=");
       if(pair[0] == variable) {
           return pair[1];
       }
   }
   return false;
}
function addData(chart, label, data) {
    chart.data.datasets.push(data);
    chart.update();
}
function optimizar()
{
	var month = getQueryVariable('month');
    var year = getQueryVariable('year');
    var store = getQueryVariable('store');
    var department = getQueryVariable('department');
    //optimizado
    $.ajax({ 
      type: "get",
      url: "/productivity/json_current",
      data: 'w=2&month='+month+'&year='+year+'&store='+store+'&department='+department,
      dataType: 'json',
      success: function(data){ 
                fecha = data.dates_week.concat(data.dates_week_2).concat(data.dates_week_3).concat(data.dates_week_4);
                mes = data.spm1;
                // enviando datos de plan de venta 
			    Cerebro.salida = enviar_datos_api_ajax("ver_salida",Cerebro.caso,Cerebro.email);
			    Cerebro.setearResumen();
			    matrixAlmuerzo 		  = Cerebro.calcularAlmuerzos();
				sum_turnos_real       = Cerebro.totalTurnosReales();
                productividad_optimizada = Cerebro.productividadOptimizada();
			    resumen_plan = Cerebro.obtenerResumen();
					
				if (resumen_plan[1] == undefined)
				{
					setTimeout( function()
					{ 
						optimizar();
					}, 1000);
					
				}
				else
				{
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
				    
				    //addData(myChart, 'Productividad Optimizada', {data: productividad_optimizada, fill: 'false', label: 'Productividad optimizada', yAxisID: 'left-y-axis',backgroundColor: '#33d6ce', borderColor: '#33d6ce'});			                  

	                
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
					resumenTurnosOptimizado = 0;

					while(count_turnos < num_turnos)
					{
						$("#turnos-"+count_turnos).html(turnos[count_turnos+num_turnos].vendedores);
						resumenTurnosOptimizado += parseInt(turnos[count_turnos+num_turnos].vendedores);
						count_turnos++;
					}
					$("#turnos-total-op").html(resumenTurnosOptimizado);
					$("#minutos_optimizando").prop('disabled', false);
					$(".btn-optimize").prop('disabled', false);
					$(".pace").attr("class", "pace pace-inactive");
					reinicio();
					Cerebro.save();
				}	
      		
      }
    });
    $('#data_opt').slideDown('fast')
    
}

var centesimas = 0;
var segundos = 0;
var minutos = 0;
var horas = 0;
function inicio () {
	control = setInterval(cronometro,10);
}
function parar () {
	clearInterval(control);
}
function reinicio () {
	clearInterval(control);
	centesimas = 0;
	segundos = 0;
	minutos = 0;
	horas = 0;
	Centesimas.innerHTML = ":00";
	Segundos.innerHTML = ":00";
	Minutos.innerHTML = ":00";
	Horas.innerHTML = "00";
}
function cronometro () {
	if (centesimas < 99) {
		centesimas++;
		if (centesimas < 10) { centesimas = "0"+centesimas }
		Centesimas.innerHTML = ":"+centesimas;
	}
	if (centesimas == 99) {
		centesimas = -1;
	}
	if (centesimas == 0) {
		segundos ++;
		if (segundos < 10) { segundos = "0"+segundos }
		Segundos.innerHTML = ":"+segundos;
	}
	if (segundos == 59) {
		segundos = -1;
	}
	if ( (centesimas == 0)&&(segundos == 0) ) {
		minutos++;
		if (minutos < 10) { minutos = "0"+minutos }
		Minutos.innerHTML = ":"+minutos;
	}
	if (minutos == 59) {
		minutos = -1;
	}
	if ( (centesimas == 0)&&(segundos == 0)&&(minutos == 0) ) {
		horas ++;
		if (horas < 10) { horas = "0"+horas }
		Horas.innerHTML = horas;
	}
}


$(document).on('click','.btn-optimize', function()
{
	var tiempo = {
        hora: 0,
        minuto: 0,
        segundo: 0
    };

    var tiempo_corriendo = null;

    var cronometro = function(){
        if ( $(this).text() == 'Comenzar' )
        {
            $(this).text('Detener');                        
            tiempo_corriendo = setInterval(function(){
                // Segundos
                tiempo.segundo++;
                if(tiempo.segundo >= 60)
                {
                    tiempo.segundo = 0;
                    tiempo.minuto++;
                }      

                // Minutos
                if(tiempo.minuto >= 60)
                {
                    tiempo.minuto = 0;
                    tiempo.hora++;
                }

                $("#hour").text(tiempo.hora < 10 ? '0' + tiempo.hora : tiempo.hora);
                $("#minute").text(tiempo.minuto < 10 ? '0' + tiempo.minuto : tiempo.minuto);
                $("#second").text(tiempo.segundo < 10 ? '0' + tiempo.segundo : tiempo.segundo);
            }, 1000);
        }
        else 
        {
            $(this).text('Comenzar');
            clearInterval(tiempo_corriendo);
        }
    }

	if ($("#minutos_optimizando").val() !== "")
	{
		Cerebro.brainJson = enviar_datos_api_ajax("resultado", Cerebro.caso, Cerebro.email);
		Cerebro.plan.tiempo_maximo = parseInt($("#minutos_optimizando").val()); 
		Cerebro.plan.id_caso = Cerebro.caso; 
		ejecutarCaso();
		
		$("#minutos_optimizando").prop('disabled', true);
		$(".btn-optimize").prop('disabled', true);

		$(".pace").attr("class", "pace");
		inicio();

		setTimeout(function()
		{ 
			$('.page-container').pgNotification({
		        style: 'simple',
		        message: 'Esperando..',
		        timeout: 3000,
		        type: 'info',
		    }).show(); 
			optimizar(); 
		},
		parseInt(($("#minutos_optimizando").val()*60000)+3000));
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

