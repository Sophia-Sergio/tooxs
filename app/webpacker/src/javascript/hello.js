import Chart from 'chart.js';

export default class Hello {
  constructor() {
    const chartCanvas = document.querySelector('[data-chart="canvas"]');
    var myChart = new Chart( chartCanvas, {
      type: 'line',
      data: {
        labels: ["30-04","01-05","02-05","03-05","04-05","05-05","06-05","07-05","08-05","09-05","10-05","11-05","12-05","13-05","14-05","15-05","16-05","17-05","18-05","19-05","20-05","21-05","22-05","23-05","24-05","25-05","26-05","27-05"],
        datasets: [
          {
            label: 'Eficiencia real',
            data: [91.3,68.09,51.97,59.81999999999999,60.31999999999999,74.24,79.41,60.400000000000006,58.25999999999999,87.17999999999999,69.0,69.72,67.20999999999998,72.57000000000001,51.66999999999999,93.10000000000001,58.620000000000005,80.0,89.89,64.18,96.59,94.19999999999999,75.86,57.5,78.41,78.0,63.24000000000001,75.22],
            backgroundColor: 'rgba(71, 196, 254, .2)',
            borderColor: 'rgba(71, 196, 254, 1)',
            borderWidth: 2,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderWidth: 2,
            pointRadius: 5,
          },
          {
            label: 'Eficiencia optima',
            data: [98.44,87.72,83.53999999999999,79.76,87.36,96.25,67.74,83.55999999999999,84.81,78.57,94.52000000000001,97.44,82.0,90.67,92.54,96.86999999999999,81.92999999999999,94.44,82.35,89.58,97.7,92.86000000000001,93.55,90.78999999999999,93.85,98.7,86.00000000000001,86.67],
            backgroundColor: 'rgba(137, 218, 89, .2)',
            borderColor: 'rgba(137, 218, 89, 1)',
            borderWidth: 2,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderWidth: 2,
            pointRadius: 5,
          },
        ],
      },
      options: {
        maintainAspectRatio: false,
        responsive: true,
      }
    });
    console.log('Hello World from Hello component')
  }

}