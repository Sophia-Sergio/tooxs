/***
* Inicio de API 
* 
*
*/
if ($('#productivity_report').length > 0) 
{
  function setearProductividad( titulo, plan, dotacion)
  {
    productividad = Array();
    productividad[0] = parseInt(plan[0]/dotacion[0]);
    productividad[1] = parseInt(plan[1]/dotacion[1]);
    productividad[2] = parseInt(plan[2]/dotacion[2]);
    productividad[3] = parseInt(plan[3]/dotacion[3]);


    table = $("<table/>", { "class": "table-shift table table-bordered bg-master-lightest" });
    thead = $("<thead/>", {});

    $(thead).html('<tr class="bg-success"><td colspan="8" class="text-center no-padding"><h3 class="no-margin text-uppercase text-white fs-15"></h3></td></tr><tr><th class="text-center"></th><th class="text-center">Semana 1</th><th class="text-center">Semana 2</th><th class="text-center">Semana 3</th><th class="text-center">Semana 4</th></tr>');
    table.append(thead);

    tbody = $("<tbody/>", { "class": "t-p-3" });
    planSet = $('<tr/>', {'html': '<td>Plan de Venta</td><td class="plan-w1">'+fn.formateaNumero(plan[0])+'</td><td class="plan-w2">'+fn.formateaNumero(plan[1])+'</td><td class="plan-w3">'+fn.formateaNumero(plan[2])+'</td><td class="plan-w4">'+fn.formateaNumero(plan[3])+'</td>'});
    dotacionSet = $('<tr/>', {'html': '<td>Dotación Semanal (HH)</td><td class="dotacion-w1">'+fn.formateaNumero(dotacion[0])+'</td><td class="dotacion-w2">'+fn.formateaNumero(dotacion[1])+'</td><td class="dotacion-w3">'+fn.formateaNumero(dotacion[2])+'</td><td class="dotacion-w4">'+fn.formateaNumero(dotacion[3])+'</td>'});
    productividadSet = $('<tr/>', {'html': '<td>Productividad</td><td class="productividad-w1">'+fn.formateaNumero(productividad[0])+'</td><td class="productividad-w2">'+fn.formateaNumero(productividad[1])+'</td><td class="productividad-w3">'+fn.formateaNumero(productividad[2])+'</td><td class="productividad-w4">'+fn.formateaNumero(productividad[3])+'</td>'}); 

    $(tbody).append(planSet);
    $(tbody).append(dotacionSet);
    $(tbody).append(productividadSet);
    $(table).append(tbody);

    $("#productividades").append("<br><h3>"+titulo+"</h3>");
    $("#productividades").append(table);
  }

  function getQueryVariable(variable) 
  {
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
  console.log('init productivity_demo');
  var month = getQueryVariable('month');
  var year = getQueryVariable('year');
  var store = getQueryVariable('store');
  var department = getQueryVariable('department');
  var week = getQueryVariable('week');
  var data_month = "";
  //si existen datos en la bd los trae
  $(document).ready(function()
  {
    var datasets1 = $.ajax(
    { 
      type: "GET",
      url: '/productivity/data_month',
      async: false,
      data: 'month='+month+'&year='+year+'&store='+store+'&department='+department,
      dataType: 'json',
      success: function(json)
      { 
        return json;
      }
    });

    if (!datasets1.responseJSON.existe)
    {
        // si no carga la API
        $('.page-container').pgNotification({
          style: 'simple',
          message: 'Cargando datos',
          timeout: 3000,
          type: 'info',
        }).show();

        var datasets = $.ajax(
        { 
          type: "get",
          url: "/productivity/json_current",
          data: 'month='+month+'&year='+year+'&store='+store+'&department='+department+'&week='+$('#week').val()+'&'+$('.simple_form').serialize(),
          dataType: 'json',
          success: function(data)
          { 
             
            fecha = data.dates_week.concat(data.dates_week_2).concat(data.dates_week_3).concat(data.dates_week_4);
            mes  = data.spm1;
            tsm1 = data.tsm1;
            pam1 = data.pam1;
            vrm1 = data.vrm1;
            // incializar api
            Cerebro.enviarDatos(plan_enviado);
            productividad_diaria = Cerebro.productividadDiaria();
            sum_turnos_real   = Cerebro.totalTurnosReales();
            resumen_plan = Cerebro.obtenerResumen();
            productividad_objetivo = Cerebro.productividadObjetivo();
            productividad_actual = Cerebro.cacularProductividad(mes);
            productividad_real = Cerebro.cacularProductividad(vrm1);
            for (var i = 0; i < sum_turnos_real.length; i++) 
            {
              $("#optimo-"+[i+1]).html(sum_turnos_real[i]);
            }

            var config = {
              type: 'line',
              data: 
              {
                datasets: 
                [
                  {data: productividad_actual, label: 'Productividad Actual $CLP', yAxisID: 'left-y-axis',borderColor: 'rgb(75, 192, 192)'},
                  {data: productividad_real, label: 'Productividad Real $CLP', yAxisID: 'left-y-axis',borderColor: 'rgb(255, 99, 132)'},  
                  {pointRadius: 0, borderDash: [10, 5], data: productividad_objetivo, label: 'Productividad/Dotación Ideal $CLP', yAxisID: 'left-y-axis', borderColor: 'rgb(179, 178, 178)'}
                ],
                labels: fecha
              },
              options: 
              {
                scales: 
                {
                  yAxes: [{ id: 'left-y-axis', type: 'linear', position: 'left' }]
                }
              }
            }     

            var ctx = document.getElementById("canvas").getContext("2d");
            var myChart = new Chart(ctx, config);

            $('.page-container').pgNotification(
            {
              style: 'simple',
              message: 'Cargado',
              timeout: 3000,
              type: 'info',
            }).show();

            // setear datos de resumen
            plan_w = Calculo.semanal(Cerebro.planVentaDiario(), 7);
            plan_w1 = plan_w[0]; 
            plan_w2 = plan_w[1];
            plan_w3 = plan_w[2];
            plan_w4 = plan_w[3];
            $("#plan-w1").html(fn.formateaNumero(plan_w1));
            $("#plan-w2").html(fn.formateaNumero(plan_w2));
            $("#plan-w3").html(fn.formateaNumero(plan_w3));
            $("#plan-w4").html(fn.formateaNumero(plan_w4));


            dotacion_w = Calculo.semanal(Cerebro.sumatoriaTurnosDiaria(), 7);
            dotacion_w1 = dotacion_w[0]; 
            dotacion_w2 = dotacion_w[1];
            dotacion_w3 = dotacion_w[2];
            dotacion_w4 = dotacion_w[3];
            $("#dotacion-w1").html(dotacion_w1);
            $("#dotacion-w2").html(dotacion_w2);
            $("#dotacion-w3").html(dotacion_w3);
            $("#dotacion-w4").html(dotacion_w4);

            productividad_w = Calculo.semanal(Cerebro.productividadDiaria(), 7);
            productividad_w1 = productividad_w[0]; 
            productividad_w2 = productividad_w[1];
            productividad_w3 = productividad_w[2];
            productividad_w4 = productividad_w[3];
            $("#productividad-w1").html(fn.formateaNumero(parseInt(plan_w1/dotacion_w1)));
            $("#productividad-w2").html(fn.formateaNumero(parseInt(plan_w2/dotacion_w2)));
            $("#productividad-w3").html(fn.formateaNumero(parseInt(plan_w3/dotacion_w3)));
            $("#productividad-w4").html(fn.formateaNumero(parseInt(plan_w4/dotacion_w4)));
            //cargar turnos
            
            Cerebro.setearTurnos();
            turnos = Cerebro.turnos;                      
            num_turnos = Cerebro.plan.datos.num_turnos;
            count_turnos = 0;
            if (turnos)
            {              
              while(count_turnos < num_turnos)
              {
                $("#tabla-resumen tbody").append("<tr><td>" + turnos[count_turnos].turno + "</td><td>" + turnos[count_turnos].vendedores + "</td><td id='turnos-"+count_turnos+"'></td></tr>");
                count_turnos++;
              }
            }

            //cargar margen de eficiencia                       
            dotacion_m1 = Calculo.semanal(Cerebro.sumatoriaTurnosDiaria(), Cerebro.sumatoriaTurnosDiaria().length);
            $("#hh-actual").html(fn.formateaNumero(dotacion_m1));
            
            // mostrar botones
            $("#botones-optimizar").show();
          }
        });
    }
    else
    {
       $("#botones-optimizar").hide();
        var datasets = $.ajax(
        { 
          type: "get",
          url: "/productivity/json_current",
          data: 'month='+month+'&year='+year+'&store='+store+'&department='+department+'&week='+$('#week').val(),
          dataType: 'json',
          success: function(data)
          { 
            fecha = data.dates_week.concat(data.dates_week_2).concat(data.dates_week_3).concat(data.dates_week_4);
            mes = data.spm1;
            vrm1 = data.vrm1;
            vent_real = data.vent_real;
            dot_real = data.dot_real;

            // incializar Datos guardados            
            Cerebro.plan = plan_enviado;
            var respuesta = "";
            Cerebro.caso = Cerebro.plan.id_caso;
            Cerebro.salida = datasets1.responseJSON.summary;//enviar_datos_api_ajax("ver_salida", this.caso, this.email);
            Cerebro.setearResumen();
            productividad_diaria = Cerebro.productividadDiaria();
            sum_turnos_real = Cerebro.totalTurnosReales();
            resumen_plan = Cerebro.obtenerResumen();
            productividad_objetivo = Cerebro.productividadObjetivo();


            //cargar turnos
            Cerebro.setearTurnos();
            turnos       = Cerebro.turnos;                      
            num_turnos   = Cerebro.plan.datos.num_turnos;
            count_turnos = 0;

            while(count_turnos < num_turnos)
            {
              $("#tabla-resumen tbody").append("<tr><td>" + turnos[count_turnos].turno + "</td><td>" + turnos[count_turnos].vendedores + "</td><td id='turnos-"+count_turnos+"'></td></tr>");
              count_turnos++;
            }

            //cargar margen de eficiencia                       
            dotacion_m1 = Calculo.semanal(Cerebro.sumatoriaTurnosDiaria(), Cerebro.sumatoriaTurnosDiaria().length);
            $("#hh-actual").html(fn.formateaNumero(dotacion_m1));

            eficiencia = (100-parseFloat(resumen_plan[0].margeAjuste.replace("%", ""))).toFixed(2);
            $("#margen-actual").html(parseFloat(eficiencia).toFixed(2)+"%");

            // fin
            Cerebro.brainJson = JSON.parse(datasets1.responseJSON.json_result);          
            productividad_diaria = Cerebro.productividadDiaria();
            sum_turnos_real   = Cerebro.totalTurnosReales();
            resumen_plan = Cerebro.obtenerResumen();
            productividad_objetivo = Cerebro.productividadObjetivo();

            for (var i = 0; i < sum_turnos_real.length; i++) 
            {
              $("#optimo-"+[i+1]).html(sum_turnos_real[i]);
            }

            matrizDelta = Cerebro.calcularDelta();
            matrizEpsilon = Cerebro.calcularEpsilon();
            matrixAlmuerzo = Cerebro.calcularAlmuerzos();
            sum_turnos_real = Cerebro.totalTurnosReales();
            productividad_diaria  = Cerebro.productividadDiaria();
            productividad_optimizada = Cerebro.productividadOptimizada();
            productividad_actual = Cerebro.cacularProductividad(mes);
            productividad_real = Cerebro.cacularProductividad(vrm1);
            productividad_objetivo = Cerebro.productividadObjetivo();
            matrizSemana = Cerebro.calcularPerdida(matrizDelta);
            resumen_plan = Cerebro.obtenerResumen();

            if (resumen_plan[1] == undefined)
            {
              setInterval( function(){ console.log("esperando...")}, 1000);
              optimizar();
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

              // setear plan actual
              plan_w = Calculo.semanal(mes, 7);
              dotacion_w = Calculo.semanal(Cerebro.sumatoriaTurnosDiaria(), 7);
              setearProductividad("Productividad actual por semanas", plan_w, dotacion_w);

              // setear plan optimizado
              plan_w_op = Calculo.semanal(Cerebro.planVentaOptimizada(), 7);
              dotacion_w_op = Calculo.semanal(Cerebro.sumatoriaTurnosOptimizado(), 7);
              setearProductividad("Productividad optimizada por semanas", plan_w_op, dotacion_w_op);

              // setear plan real
              plan_w_real = Calculo.semanal(vrm1, 7);
              dotacion_w_real = Calculo.semanal(Cerebro.sumatoriaTurnosDiaria(), 7);
              setearProductividad("Productividad real por semanas", plan_w_real, dotacion_w_real);


              var config = {
                type: 'line',
                data: {
                datasets: 
                [
                  {data: productividad_actual, label: 'Productividad Actual $CLP', yAxisID: 'left-y-axis',borderColor: 'rgb(75, 192, 192)'},
                  {data: productividad_real, label: 'Productividad Real $CLP', yAxisID: 'left-y-axis',borderColor: 'rgb(255, 99, 132)'},  
                  {data: productividad_optimizada, label: 'Productividad Optimizada $CLP', yAxisID: 'left-y-axis', borderColor: 'rgb(54, 162, 235)'},
                  {pointRadius: 0, borderDash: [10, 5], data: productividad_objetivo, label: 'Productividad/Dotación Ideal $CLP', yAxisID: 'left-y-axis', borderColor: 'rgb(179, 178, 178)'}                                  
                ],
                labels: fecha
                },
                options: 
                {
                  scales: 
                  {
                    yAxes: 
                    [{
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
              eficiencia2 = 100-parseFloat(resumen_plan[1].margeAjuste.replace("%", ""));
              dotacion_m1 = Calculo.semanal(Cerebro.sumatoriaTurnosOptimizado(), Cerebro.sumatoriaTurnosOptimizado().length);

              $("#margen-actual").html(eficiencia1+"%");
              $("#margen-optimizado").html(eficiencia2+"%");
              $("#hh-optimizado").html(fn.formateaNumero(dotacion_m1));

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


              matrizDelta = Cerebro.calcularDelta();
              matrizEpsilon = Cerebro.calcularEpsilon();

              // obtener real
              exceso = Calculo.exceso(plan_enviado.datos.prod_obj, productividad_real);
              faltante = Calculo.faltante(plan_enviado.datos.prod_obj, productividad_real);
              $("#sum-exceso").html(exceso);
              $("#sum-faltante").html(faltante);
              $(".prod_obj").html(fn.formateaNumero(plan_enviado.datos.prod_obj));
              $("#vent_real").html(fn.formateaNumero(vent_real));
              $("#dot_real").html(fn.formateaNumero(dot_real));
              $("#prod_real").html(fn.formateaNumero(Math.round(vent_real/dot_real)));


              //obtener optimizada
              exceso_op = Calculo.exceso(plan_enviado.datos.prod_obj, productividad_optimizada);
              faltante_op = Calculo.faltante(plan_enviado.datos.prod_obj, productividad_optimizada);
              vent_op = Cerebro.sumatoriaMatriz(Cerebro.planVentaOptimizada());
              dot_op = Cerebro.sumatoriaMatriz(Cerebro.sumatoriaTurnosOptimizado());
              $("#sum-exceso-op").html(exceso_op);
              $("#sum-faltante-op").html(faltante_op);
              $("#vent_op").html(fn.formateaNumero(vent_op));
              $("#dot_op").html(fn.formateaNumero(dot_op));
              $("#prod_op").html(fn.formateaNumero(Math.round(vent_op/dot_op)));
              
              eficiencia_op = (100-parseFloat(Cerebro.resumen[1].margeAjuste));
              eficiencia_real = (100-parseFloat(Cerebro.resumen[0].margeAjuste));


              $("#efinciencia-op").html(eficiencia_op+"%");
              $("#efinciencia-real").html(eficiencia_real+"%");
              $("#eficiencia-total").html(parseFloat(eficiencia_op-eficiencia_real).toFixed(2)+"%");
            } 
         }
        });      
    }
  })
}
