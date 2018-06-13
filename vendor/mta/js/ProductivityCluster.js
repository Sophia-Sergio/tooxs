if ( $('#productivity_cluster').length > 0) 
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
  $(document).ready(function() {
    var datasets;
    window.chartColors = {
      red: 'rgb(255, 99, 132)',
      orange: 'rgb(255, 159, 64)',
      yellow: 'rgb(255, 205, 86)',
      green: 'rgb(75, 192, 192)',
      blue: 'rgb(54, 162, 235)',
      purple: 'rgb(153, 102, 255)',
      grey: 'rgb(201, 203, 207)'
    };
    datasets = $.ajax({
      type: 'get',
      url: '/productivity_cluster/json_month',
      data: $('.simple_form').serialize(),
      dataType: 'json',
      success: function(data) {
        var config, ctx;
        config = {
          type: 'line',
          data: {
            labels: data.labels,
            datasets: data.datasets
          },
          options: {
            responsive: true,
            title: {
              display: true,
              text: 'Comparativa de venta Real'
            },
            tooltips: {
              mode: 'index',
              intersect: false,
              callbacks: {
                label: function(tooltipItem, chart){
                    var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
                    return datasetLabel + ': $ ' + number_format(tooltipItem.yLabel);
                }
              }
            },
            hover: {
              mode: 'nearest',
              intersect: true
            },
            scales: {
              xAxes: [
                {
                  display: true,
                  scaleLabel: {
                    display: true,
                    labelString: ''
                  }
                }
              ],
              yAxes: [
                {
                  display: true,
                  scaleLabel: {
                    display: true
                  },
                  ticks: {
                    beginAtZero: false,
                    callback: function(value, index, values) {
                      if (parseInt(value) >= 1000) {
                        return '$' + value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.');
                      } else {
                        return '$' + value;
                      }
                    }
                  }
                }
              ]
            }
          }
        };
        ctx = document.getElementById('canvas').getContext('2d');
        window.myLine = new Chart(ctx, config);
      }
    });
  });

}