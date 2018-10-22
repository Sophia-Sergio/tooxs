if ($("#efficiency_report").length > 0)
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
  var data_month = "";

  console.log("init report");
  //si existen datos en la bd los trae
  $(document).ready(function()
  {

    var datasets = $.ajax(
    { 
      type: "get",
      url: "/efficiency/report",
      data: 'month='+month+'&year='+year+'&store='+store+'&department='+department,
      dataType: 'json',
      success: function(data)
      { 

        var config = {
          type: 'line',
          data: {
          datasets: 
          [                            
            {data: data.prod_w_real, label: 'Real',fill: 'false', yAxisID: 'left-y-axis',borderColor: 'rgb(255, 99, 132)'},
            {data: data.prod_w_op, label: 'Optimizado', fill: 'false', yAxisID: 'left-y-axis',borderColor: 'rgb(54, 162, 235)'}
          ],
          labels: data.fecha
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
                      return value.toFixed(2) + '%';
                    } 
                    else 
                    {
                      return value.toFixed(2) + '%';
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
                    return datasetLabel + ': ' + tooltipItem.yLabel.toFixed(2) + '%';
                }
              }
            }
          }
        }    

        document.getElementById("chartContainer").innerHTML = '&nbsp;';
        document.getElementById("chartContainer").innerHTML = '<canvas id="canvas"></canvas>';


        var ctx = document.getElementById("canvas").getContext("2d");
        var myChart = new Chart(ctx, config);
     }
    });      

  })
}