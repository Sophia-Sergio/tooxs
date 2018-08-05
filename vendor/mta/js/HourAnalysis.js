/***
* Inicio de API 
* 
*
*/
if ($('#hour_analysis').length > 0) 
{

  function number_format(number, decimals, dec_point, thousands_sep) {
// *     example: number_format(1234.56, 2, ',', ' ');
// *     return: '1 234,56'
    number = (number + '').replace(',', '').replace(' ', '');
    var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? '.' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? ',' : dec_point,
            s = '',
            toFixedFix = function (n, prec) {
                var k = Math.pow(10, prec);
                return '' + Math.round(n * k) / k;
            };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
        s[1] = s[1] || '';
        s[1] += new Array(prec - s[1].length + 1).join('0');
    }
    return s.join(dec);
}


  function valuesReport(value)
  {
    window.location.href = "/hour_analysis/index?utf8=%E2%9C%93&store="+store+"&department="+department+"&year="+year+"&month="+month+"&grafico=2&value="+value;
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
  var val = getQueryVariable('value');
  var grafico = getQueryVariable('grafico');
  var data_month = "";

  if (grafico == 1)
  {
    $("#button-horas").attr("class", "btn btn-primary");
    $("#button-pesos").attr("class", "btn btn-secondary");      
  }
  else if (grafico == 2)
  {
    $("#button-horas").attr("class", "btn btn-secondary");
    $("#button-pesos").attr("class", "btn btn-primary");    
  }
  else
  {
    $("#button-horas").attr("class", "btn btn-primary");
    $("#button-pesos").attr("class", "btn btn-secondary");          
  }

  $("#evaluar").on("click", function()
  {
    valuesReport($("#values-hour").val());
  });

  $("#button-horas, #button-pesos").on("click", function()
  {
    graficoActual = this.dataset.grafico

    if (graficoActual == 1)
    {
      $("#chartContainer").show();
      $("#chartContainer-2").hide();
      $("#button-horas").attr("class", "btn btn-primary");
      $("#button-pesos").attr("class", "btn btn-secondary");      
    }
    else if(graficoActual == 2)
    {
      $("#chartContainer").hide();
      $("#chartContainer-2").show();
      $("#button-horas").attr("class", "btn btn-secondary");
      $("#button-pesos").attr("class", "btn btn-primary");     
    }
     
  });

  //si existen datos en la bd los trae
  $(document).ready(function()
  {
    var datasets1 = $.ajax(
    { 
      type: "GET",
      url: '/productivity/data_month',
      data: 'month='+month+'&year='+year+'&store='+store+'&department='+department,
      dataType: 'json',
      success: function(json)
      { 
        return json;
      }
    });

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

        //cargar turnos
        Cerebro.setearTurnos();
        turnos       = Cerebro.turnos;                      
        num_turnos   = Cerebro.plan.datos.num_turnos;
        count_turnos = 0;
        // fin

        Cerebro.brainJson = JSON.parse(datasets1.responseJSON.json_result);        
        productividad_real = Cerebro.cacularProductividad(vrm1);
        resumen_plan = Cerebro.obtenerResumen();


        excesoReal = Calculo.matrizExceso(plan_enviado.datos.prod_obj, productividad_real, Cerebro.sumatoriaTurnosDiaria());
        excesoOptimizado = Calculo.matrizExceso(plan_enviado.datos.prod_obj, productividad_real, Cerebro.sumatoriaTurnosOptimizado());

        var config = {
          type: 'line',
          data: {
          datasets: 
          [
            {data: excesoReal, label: 'Real', yAxisID: 'left-y-axis',borderColor: 'rgb(255, 99, 132)'},
            {data: excesoOptimizado, label: 'Optimizado', yAxisID: 'left-y-axis',borderColor: 'rgb(54, 162, 235)'}
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
                position: 'left',
                display: true,
                  scaleLabel: {
                    display: true,
                    labelString: '(-)Exceso / (+)faltantes'
                  }
              }]
            },
            tooltips: {
              mode: 'index',
              intersect: false,
              callbacks: {
                label: function(tooltipItem, chart){
                    var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                    return datasetLabel + ': ' + tooltipItem.yLabel;
                }
              }
            }
          }
        }    

        excesoRealValorado = Calculo.matrizExcesoVal(plan_enviado.datos.prod_obj, productividad_real, Cerebro.sumatoriaTurnosDiaria(), val);
        excesoOptimizadoValorado = Calculo.matrizExcesoVal(plan_enviado.datos.prod_obj, productividad_real, Cerebro.sumatoriaTurnosOptimizado(), val);

        var config2 = {
          type: 'line',
          data: {
          datasets: 
          [
            {data: excesoRealValorado, label: 'Real', yAxisID: 'left-y-axis',borderColor: 'rgb(255, 99, 132)'},
            {data: excesoOptimizadoValorado, label: 'Optimizado', yAxisID: 'left-y-axis',borderColor: 'rgb(54, 162, 235)'}
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
                position: 'left',
                display: true,
                  scaleLabel: {
                    display: true,
                    labelString: '(-)Exceso / (+)faltantes'
                  }
              }]
            },
            tooltips: {
              mode: 'index',
              intersect: false,
              callbacks: {
                label: function(tooltipItem, chart){
                    var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                    return datasetLabel + ': $ ' + fn.formateaNumero(tooltipItem.yLabel);
                }
              }
            }
          }
        }  

        document.getElementById("chartContainer").innerHTML = '&nbsp;';
        document.getElementById("chartContainer").innerHTML = '<canvas id="canvas"></canvas>';

        document.getElementById("chartContainer-2").innerHTML = '&nbsp;';
        document.getElementById("chartContainer-2").innerHTML = '<canvas id="canvas-2"></canvas>';

        var ctx = document.getElementById("canvas").getContext("2d");
        var myChart = new Chart(ctx, config);

        var ctx2 = document.getElementById("canvas-2").getContext("2d");
        var myChart = new Chart(ctx2, config2);
        
        if (grafico == 1)
        {
          $("#chartContainer").show();
          $("#chartContainer-2").hide();
        }
        else if(grafico == 2)
        {
          $("#chartContainer").hide();
          $("#chartContainer-2").show();
        }
        else
        {
          $("#chartContainer").show();
          $("#chartContainer-2").hide();
        }  

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

        // obtener real
        excesoTotal = Calculo.excesoTotal(excesoReal);
        faltanteTotal = Calculo.faltanteTotal(excesoReal);
        $("#sum-exceso").html(excesoTotal);
        $("#sum-faltante").html(faltanteTotal);

        //obtener optimizada
        exceso_op = Calculo.excesoTotal(excesoOptimizado);
        faltante_op = Calculo.faltanteTotal(excesoOptimizado);

        $("#sum-exceso-op").html(exceso_op);
        $("#sum-faltante-op").html(faltante_op);

        $("#sum-ahorro").html(parseInt(excesoTotal) - parseInt(exceso_op));
        $("#sum-recuperada").html(parseInt(faltanteTotal) - parseInt(faltante_op));
        if (val > 0)
        {
          $("#ahorro-total").html(number_format(parseInt($("#sum-ahorro").html()) * parseInt(val) ));
        }
        
        $("#recuperada-total").html(number_format(faltanteTotal * parseInt(Cerebro.plan.datos.prod_obj)));
        

        eficiencia_op = (100-parseFloat(Cerebro.resumen[1].margeAjuste));
        eficiencia_real = (100-parseFloat(Cerebro.resumen[0].margeAjuste));

        $("#efinciencia-op").html(eficiencia_op+"%");
        $("#efinciencia-real").html(eficiencia_real+"%");
        $("#eficiencia-total").html(parseFloat((eficiencia_real/eficiencia_op)*100).toFixed(2)+"%");

     }
    });      

  })
}