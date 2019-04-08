import React, { Component } from 'react';
import { Line } from 'react-chartjs-2';
import { currencyFormat, monthFormat, dayMonthFormat } from '../../helpers';

export default class Chart extends Component {
  state = {
    colors: {
      borderColors: ['rgba(71, 196, 254, 1)', 'rgba(137, 218, 89, 1)', 'rgba(227, 58, 62, 1)', 'rgba(124,244,153, 1)'],
    },
    data: {},
    chartData: null,
    datasets: {},
    borderWidth: 2,
    pointBackgroundColor: 'rgba(255, 255, 255, 1)',
    pointBorderWidth: 2,
    pointRadius: 5,
    backgroundColor: 'rgba(71, 196, 254, 0)',
    chartOptions: {
      tooltips: {
        mode: 'point',
        callbacks: {
          label: (tooltipItem, data) => {
            var label = data.datasets[tooltipItem.datasetIndex].label || '';
            if (label) { label += ': '; }
            label += '$' + currencyFormat(tooltipItem.yLabel).toString();
            return label;
          }
        }
      },
      scales: {
        yAxes: [
          {
            ticks: {
              beginAtZero: false,
              userCallback: function(value, index, values) {
                return '$' + currencyFormat(value).toString();
              }
            }
          }
        ]
      },
      maintainAspectRatio: false,
      responsive: true
    }
  }

  componentDidUpdate(){
    if ('datasets' in this.props.chartData && this.props.chartData.datasets.length > 0 ){
      if (!this.state.chartData || this.state.data != this.props.chartData){
        this.setState({data: this.props.chartData})
        this.datasetsGenerator(this.props.chartData.datasets);
      }
    }
  }

  datasetsGenerator = (data) => {
    let chartData = {datasets: [], labels: []};
    data.forEach((element, index) => {
      chartData.datasets.push({
        backgroundColor: this.state.backgroundColor,
        label: element.label,
        borderColor: this.state.colors.borderColors[index],
        borderWidth: this.state.borderWidth,
        data: element.data,
        pointBorderWidth: this.state.pointBorderWidth,
        pointRadius: this.state.pointRadius
      })
    });
    chartData.labels = this.props.chartData.labels;
    this.setState({chartData})
  }

  render(){
    return(
      <div className="card dashboard__chart">
        <div className="dashboard__chart__canvas">
          {this.state.chartData && <Line
            data={this.state.chartData}
            options={this.state.chartOptions}
          />}
        </div>
      </div>
    )
  }
}