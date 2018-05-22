/***
* Inicio de API 
* 
*
*/
if ($('#productivity_report').length > 0) 
{ 
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
            mes = data.spm1;
            tsm1 = data.tsm1;
            // incializar api
            Cerebro.enviarDatos(plan_enviado);
            productividad_diaria = Cerebro.productividadDiaria();
            sum_turnos_real   = Cerebro.totalTurnosReales();
            resumen_plan = Cerebro.obtenerResumen();
            productividad_objetivo = Cerebro.productividadObjetivo();

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
                  { pointRadius: 0, borderDash: [10, 5], data: productividad_objetivo, label: 'Productividad Ideal $CLP', yAxisID: 'left-y-axis', borderColor: 'rgb(179, 178, 178)'},
                  { data: productividad_diaria, label: 'Productividad Actual $CLP', yAxisID: 'left-y-axis', borderColor: 'rgb(75, 192, 192)'},
                  { data: tsm1, label: 'Productividad Real $CLP', yAxisID: 'left-y-axis', borderColor: 'rgb(255, 99, 132)'}                                      
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
            while(count_turnos < num_turnos)
            {
              $("#tabla-resumen tbody").append("<tr><td>" + turnos[count_turnos].turno + "</td><td>" + turnos[count_turnos].vendedores + "</td><td id='turnos-"+count_turnos+"'></td></tr>");
              count_turnos++;
            }

            //cargar margen de eficiencia                       
            dotacion_m1 = Calculo.semanal(Cerebro.sumatoriaTurnosDiaria(), Cerebro.sumatoriaTurnosDiaria().length);
            $("#hh-actual").html(dotacion_m1);

            eficiencia = (100-parseFloat(resumen_plan[0].margeAjuste.replace("%", ""))).toFixed(2);
            $("#margen-actual").html(parseFloat(eficiencia).toFixed(2)+"%");
          }
        });
    }
    else
    {
        var datasets = $.ajax(
        { 
          type: "get",
          url: "/productivity/json_current",
          data: 'month='+month+'&year='+year+'&store='+store+'&department='+department+'&week='+$('#week').val()+'&'+$('.simple_form').serialize(),
          dataType: 'json',
          success: function(data)
          { 
            fecha = data.dates_week.concat(data.dates_week_2).concat(data.dates_week_3).concat(data.dates_week_4);
            mes = data.spm1;
            tsm1 = data.tsm1;
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
            while(count_turnos < num_turnos)
            {
              $("#tabla-resumen tbody").append("<tr><td>" + turnos[count_turnos].turno + "</td><td>" + turnos[count_turnos].vendedores + "</td><td id='turnos-"+count_turnos+"'></td></tr>");
              count_turnos++;
            }

            //cargar margen de eficiencia                       
            dotacion_m1 = Calculo.semanal(Cerebro.sumatoriaTurnosDiaria(), Cerebro.sumatoriaTurnosDiaria().length);
            $("#hh-actual").html(dotacion_m1);

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
            productividad_objetivo = Cerebro.productividadObjetivo();
            matrizSemana = Cerebro.calcularPerdida(matrizDelta);
            resumen_plan = Cerebro.obtenerResumen();



            $("#sum-ganancia").html(Cerebro.sumatoriaMatriz(matrizDelta));
            $("#sum-perdida").html(Cerebro.sumatoriaMatriz(matrizEpsilon));


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


              var config = {
              type: 'line',
              data: {
              datasets: [
              {data: productividad_diaria, label: 'Productividad Actual $CLP', yAxisID: 'left-y-axis',borderColor: 'rgb(75, 192, 192)'},
              {data: tsm1, label: 'Productividad Real $CLP', yAxisID: 'left-y-axis',borderColor: 'rgb(255, 99, 132)'},  
              {data: productividad_optimizada, label: 'Productividad Optimizada $CLP', yAxisID: 'left-y-axis', borderColor: 'rgb(54, 162, 235)'},
              {pointRadius: 0, borderDash: [10, 5], data: productividad_objetivo, label: 'Productividad/Dotación Ideal $CLP', yAxisID: 'left-y-axis', borderColor: 'rgb(179, 178, 178)'}                                  
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
         }
        });      
    }
  })
}
