/***
* Inicio de API 
* 
*
*/
if ($('#productivity_report').length > 0) 
{
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

    }
    else
    {
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
            Cerebro.caso = Cerebro.plan.id_caso;
            Cerebro.salida = datasets1.responseJSON.summary;
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

              exceso = Calculo.matrizExceso(plan_enviado.datos.prod_obj, productividad_real);

              var config = {
                type: 'line',
                data: {
                datasets: 
                [
                  {data: exceso, label: 'Prod. sin Optimizar', yAxisID: 'left-y-axis',borderColor: 'rgb(75, 192, 192)'}
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
              exceso = Calculo.excesoTotal(plan_enviado.datos.prod_obj, productividad_real);
              faltante = Calculo.faltanteTotal(plan_enviado.datos.prod_obj, productividad_real);
              $("#sum-exceso").html(exceso);
              $("#sum-faltante").html(faltante);
              $(".prod_obj").html(fn.formateaNumero(plan_enviado.datos.prod_obj));
              $("#vent_real").html(fn.formateaNumero(vent_real));
              $("#dot_real").html(fn.formateaNumero(dot_real));
              $("#prod_real").html(fn.formateaNumero(Math.round(vent_real/dot_real)));


              //obtener optimizada
              exceso_op = Calculo.excesoTotal(plan_enviado.datos.prod_obj, productividad_optimizada);
              faltante_op = Calculo.faltanteTotal(plan_enviado.datos.prod_obj, productividad_optimizada);
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
