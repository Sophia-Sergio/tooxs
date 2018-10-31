window.onload = function() {
    new Chart(document.getElementById("myChart1").getContext('2d'), {
        type: 'pie',
        data: {
        labels: ["Bebidas", "Verduras", "Cereales", "Quesos y Fiambres"],
        datasets: [{
            label: "Population (millions)",
            backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
            data: [2478,5267,734,784,433]
        }]
        },
        options: {
        title: {
            display: true,
            // text: 'Predicted world population (millions) in 2050'
        }
        }
    });

    new Chart(document.getElementById("myChart2").getContext('2d'), {
        type: 'pie',
        data: {
        labels: ["Turno 45hrs", "Turno 36hrs"],
        datasets: [{
            label: "Population (millions)",
            backgroundColor: ["#e8c3b9","#c45850"],
            data: [784,433]
        }]
        },
        options: {
        title: {
            display: true,
            // text: 'Predicted world population (millions) in 2050'
        }
        }
    });
  };