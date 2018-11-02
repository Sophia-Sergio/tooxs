window.onload = function() {
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

    // new Chart(document.getElementById("myChart3"), {
    //     type: 'horizontalBar',
    //     data: {
    //       labels: ["Africa",],
    //       datasets: [
    //         {
    //           label: "Turnos",
    //           backgroundColor: ["#3e95cd",],
    //           data: [2478,5267,734,784,433]
    //         }
    //       ]
    //     },
    //     options: {
    //       legend: { display: false },
    //       title: {
    //         display: true,
    //         text: 'Turnos Cubiertos'
    //       }
    //     }
    // });
    
  };