if ( $('#sales_cluster').length > 0) 
{
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
      url: '/sales_cluster/json_month',
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
              text: 'Comparativa de Productividad'
            },
            tooltips: {
              mode: 'index',
              intersect: false
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
                    labelString: 'Semana'
                  }
                }
              ],
              yAxes: [
                {
                  display: true,
                  scaleLabel: {
                    display: true,
                    labelString: '$MM'
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