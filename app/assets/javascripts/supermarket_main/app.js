window.onload = function() {

  if($('#chart-area1').length > 0) {
    var ctx1 = document.getElementById('chart-area1').getContext('2d');
    window.myPie1 = new Chart(ctx1, config1);
  }
  if($('#chart-area2').length > 0){
    var ctx2 = document.getElementById('chart-area2').getContext('2d');
    window.myPie2 = new Chart(ctx2, config2);
  }
  if($('#myChart1').length > 0){
    new Chart(document.getElementById("myChart1").getContext('2d'), {
      type: 'pie',
      data: {
      labels: ["76.6% de cumplimiento"],
      datasets: [{
          label: "cumplimiento",
          backgroundColor: ["#6b6ef9","#c8c7cd"],
          data: [1500,433]
      }]
      },
      options: {
      title: {
          display: true,
          text: 'Cumplimiento de plan'
        }
      }
    });
  }
  if($('#myChart2').length > 0){
    new Chart(document.getElementById("myChart2").getContext('2d'), {
      type: 'pie',
      data: {
      labels: ["67.02% Productividad objetiva xxx unidades/hora"],
      datasets: [{
          label: "unidades",
          backgroundColor: ["#ff0076","#c8c7cd"],
          data: [784,433]
      }]
      },
      options: {
      title: {
          display: true,
          text: 'Eficiencia'
        }
      }
    });
  }
};