import React, { Component } from 'react';
import { Line } from 'react-chartjs-2';
import { currencyFormat, monthFormat, dayMonthFormat } from '../lib/helpers';

export default class Chart extends Component {
  constructor(props) {
    super(props);
    this.state = {
      colors: {
        border: [
          'rgba(71, 196, 254, 1)',
          'rgba(137, 218, 89, 1)',
          'rgba(227, 58, 62, 1)',
          'rgba(124,244,153, 1)'
        ],
        background: null,
        pointBackground: 'rgba(255, 255, 255, 1)'
      },
      data: {},
      chartData: null,
      borderWidth: 2,
      pointBorderWidth: 2,
      pointRadius: 5,
      chartOptions: {
        tootip: null,
        scales: null,
        maintainAspectRatio: false,
        responsive: true
      },
      currency: false
    };
    this.state.colors.background = this.hasBackgroundColor();
  }

  componentDidUpdate() {
    if (
      'datasets' in this.props.chartData &&
      this.props.chartData.datasets.length > 0
    ) {
      if (!this.state.chartData || this.state.data != this.props.chartData) {
        this.setState({ data: this.props.chartData });
        this.datasetsGenerator(this.props.chartData.datasets);
      }
    }
  }

  datasetsGenerator = data => {
    let chartData = { datasets: [], labels: [] };
    data.forEach((element, index) => {
      chartData.datasets.push({
        pointBackgroundColor: this.state.colors.pointBackground,
        backgroundColor: this.state.colors.background[index],
        label: element.label,
        borderColor: this.state.colors.border[index],
        borderWidth: this.state.borderWidth,
        data: element.data,
        pointBorderWidth: this.state.pointBorderWidth,
        pointRadius: this.state.pointRadius
      });
    });
    chartData.labels = this.props.chartData.labels;
    this.setState({ chartData });
    this.chartOptions();
  };

  hasBackgroundColor = () => {
    if (this.props.background) {
      return [
        'rgba(71, 196, 254, 0.1)',
        'rgba(137, 218, 89, 0.1)',
        'rgba(227, 58, 62, 0.1)',
        'rgba(124,244,153, 0.1)'
      ];
    } else {
      return [
        'rgba(71, 196, 254, 0)',
        'rgba(137, 218, 89, 0)',
        'rgba(227, 58, 62, 0)',
        'rgba(124,244,153, 0)'
      ];
    }
  };

  chartOptions = () => {
    let chartOptions = {
      maintainAspectRatio: this.state.chartOptions.maintainAspectRatio,
      responsive: this.state.chartOptions.responsive
    };
    if (this.props.currency) {
      chartOptions.tootip = this.tooltipsCurrencyOption();
      chartOptions.scales = this.scalesCurrencyOption();
    }
    this.setState({ chartOptions });
  };

  tooltipsCurrencyOption = () => {
    const tooltips = {
      mode: 'point',
      callbacks: {
        label: (tooltipItem, data) => {
          var label = data.datasets[tooltipItem.datasetIndex].label || '';
          if (label) {
            label += ': ';
          }
          label += '$' + currencyFormat(tooltipItem.yLabel).toString();
          return label;
        }
      }
    };
    return tooltips;
  };

  scalesCurrencyOption = () => {
    const scales = {
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
    };
    return scales;
  };

  render() {
    return (
      <div className="card dashboard__chart">
        <div className="dashboard__chart__canvas">
          {this.state.chartData && (
            <Line
              data={this.state.chartData}
              options={this.state.chartOptions}
            />
          )}
        </div>
      </div>
    );
  }
}
