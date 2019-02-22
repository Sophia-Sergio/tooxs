import React, { Component } from 'react';
import axios from 'axios';
import Select from 'react-select';
import {Line} from 'react-chartjs-2';
import { currencyFormat, monthFormat, dayMonthFormat } from '../helpers';
import WeekSells from './WeekSells';

class MonthSells extends Component {
  state = {
    month: { value: '7', label: 'Julio' },
    monthOptions: [
      { value: '7', label: 'Julio' },
      { value: '6', label: 'Junio' },
      { value: '5', label: 'Mayo' }
    ],
    chartData: {},
    chartOptions: {
      tooltips: {
        mode: 'point',
        callbacks: {
          label: (tooltipItem, data) => {
            var label = data.datasets[tooltipItem.datasetIndex].label || '';
            if (label) {
              label += ': ';
            }
            label += '$' + currencyFormat(tooltipItem.yLabel).toString();
            return label;
          },
        },
      },
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: false,
            // stepSize: 500000,
            userCallback: function(value, index, values) {
              return '$' + currencyFormat(value).toString();
            }
          }
        }]
      },
      maintainAspectRatio: false,
      responsive: true,
    },
  }

  componentDidMount = () => {
    this.getAchievementsData();
  }

  getAchievementsData = () => {
    const minDate = new Date(),
          maxDate = new Date(),
          minMonth = minDate.getMonth(),
          minYear = minDate.getFullYear(),
          maxMonth = maxDate.getMonth(),
          maxYear = maxDate.getFullYear();
    var parameters = `store=13&department=1&year_start=${minYear}&month_start=${minMonth}&year_end=${maxYear}&month_end=${maxMonth}`;
    axios.get(`${this.props.root_url}/api/v1/employees/${this.props.employee.id}/achievements_chart?${parameters}`)
      .then(res => {
        this.setState({
          chartData: {
            datasets: res.data.datasets,
            labels: res.data.labels.map( label => (dayMonthFormat(label)) ),
          },
        });
        this.setState(state => {
          state.chartData.datasets[0].backgroundColor = 'rgba(71, 196, 254, .2)';
          state.chartData.datasets[0].borderColor = 'rgba(71, 196, 254, 1)';
          state.chartData.datasets[0].borderWidth = 2;
          state.chartData.datasets[0].pointBackgroundColor = 'rgba(255, 255, 255, 1)';
          state.chartData.datasets[0].pointBorderWidth = 2;
          state.chartData.datasets[0].pointRadius = 5;
          return state;
        });
      })
      .catch(error => {
        console.log(error);
      });
  }

  render () {
    const { month, monthOptions } = this.state;
    const { month_sales } = this.props;
    return (
      <div className="tab-pane fade" id="sells" role="tabpanel" aria-labelledby="sells-tab">
        <div className="tab-pane__content">
          <div className="tab-pane__content__head mb-2">
            <h3 className="tab-pane__content__head__title">Ventas del colaborador</h3>
            <div className="form-group">
              <Select
                options={monthOptions}
                placeholder={`Departamento`}
                onChange={this.monthChange}
                value={month}
              />
            </div>
            <div className="dashboard__chart mb-4">
              <div className="dashboard__chart__canvas">
                <Line
                  data={this.state.chartData}
                  options={this.state.chartOptions}
                />
              </div>
            </div>
            <h3 className="tab-pane__content__head__title">Ventas por semana</h3>
          </div>
          <ul className="tab-pane__content__list mb-4">
            <li>Plan mensual: <strong>$4.200.000</strong></li>
            <li>Ventas Plan / Real: <strong>$3.080.000 / $2.950.000</strong></li>
            <li>Mi cumplimiento a la fecha: <strong>78%</strong></li>
          </ul>
          {month_sales.map( (month, index) => (
            <WeekSells key={index} month={month} />
          ))}
        </div>
      </div>
    );
  }
}

export default MonthSells;
