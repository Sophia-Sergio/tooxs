/***
* Inicio de API
*
*
*/
if ($('#productivity_report').length > 0)
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
    window.location.href = "/productivity/report?utf8=%E2%9C%93&store="+store+"&department="+department+"&year="+year+"&month="+month+"&grafico=2&value="+value;
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
  var month = getQueryVariable('month') || 6;
  var year = getQueryVariable('year') || 2018;
  var store = getQueryVariable('store') || 1;
  var department = getQueryVariable('department') || 1;
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

    label_graph = 'Real';
    if(month == 6){
      label_graph = "No Optimizado";
    }

    var datasets = $.ajax(
    {
      type: "get",
      url: "/productivity/report_data",
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

        prod_obj_line = [];

        for (var i = 0; i < data.prod_w_real.length; i++)
        {
            prod_obj_line[i] = data.prod_obj;
        }

        var config = {
          type: 'line',
          data: {
          datasets:
          [
            {pointRadius: 0, borderDash: [10, 5], data: prod_obj_line, fill: 'false', label: 'Productividad ideal', borderColor: 'rgb(179, 178, 178)'},
            {data: data.prod_w_real, label: label_graph,fill: 'false', yAxisID: 'left-y-axis',borderColor: 'rgb(255, 99, 132)'},
            {data: data.prod_w_op, label: 'Optimizado', fill: 'false', yAxisID: 'left-y-axis',borderColor: 'rgb(54, 162, 235)'}
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
                ticks: {
                  callback: function(value, index, values)
                  {
                    if (parseInt(value) >= 1000)
                    {
                      return '$' + value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
                    }
                    else
                    {
                      return '$' + value;
                    }
                  }
                }
              }]
            },
            tooltips: {
              mode: 'index',
              intersect: false,
              callbacks: {
                label: function(tooltipItem, chart){
                    var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                    return datasetLabel + ': $' + fn.formateaNumero(tooltipItem.yLabel);
                }
              }
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

        eficiencia_op = (100-parseFloat(Cerebro.resumen[1].margeAjuste));
        eficiencia_real = (100-parseFloat(Cerebro.resumen[0].margeAjuste));

        $("#efinciencia-op").html(eficiencia_op+"%");
        $("#efinciencia-real").html(eficiencia_real+"%");
        $("#eficiencia-total").html(parseFloat(((eficiencia_op-eficiencia_real)/eficiencia_real)*100).toFixed(2)+"%");

     }
    });

  })
}
