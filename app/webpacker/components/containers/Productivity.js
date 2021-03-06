import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat } from "../lib/helpers";
import Select from 'react-select';
import {Line} from 'react-chartjs-2';
import { merge } from 'lodash';

export default class Productivity extends Component {

  state = {
    loading: false,
    worlds: [
      { value: '1', label: 'Hombre'},
      { value: '2', label: 'Mujer'},
      { value: '3', label: 'Niños'},
      { value: '4', label: 'ElectroHogar'},
      { value: '5', label: 'Decohogar'}
    ],
    world: { value: '4', label: 'ElectroHogar'},
    departmentDefault: { value: '1', label: 'Alto Las Condes' },
    department: { value: '3', label: 'Audio y Video' },
    departmentOptions: [
      { value: '3', label: 'Audio y Video' },
      { value: '1', label: 'Computación y Hogar' },
      { value: '2', label: 'Cuidado Personal' }
    ],
    year: { value: '2019', label: '2019' },
    yearOptions: [
      { value: '2019', label: '2019' },
      { value: '2018', label: '2018' },
      { value: '2017', label: '2017' }
    ],
    month: { value: '3', label: 'Marzo' },
    monthOptions: [
      { value: '3', label: 'Marzo' },
      { value: '4', label: 'Abril' },
      { value: '5', label: 'Mayo' },
      { value: '6', label: 'Junio' },
      { value: '7', label: 'Julio' },
      { value: '8', label: 'Agosto' },
      { value: '9', label: 'septiembre' },
      { value: '10', label: 'Octubre' },
      { value: '11', label: 'Noviembre' },
      { value: '12', label: 'Diciembre' }
    ],
    chartData: {
      labels: ["25-02","26-02","27-02","28-02","01-03","02-03","03-03","04-03","05-03",
                "06-03","07-03","08-03","09-03","10-03","11-03","12-03","13-03","14-03","15-03","16-03","17-03","18-03","19-03","20-03","21-03","22-03","23-03","24-03"],
      datasets:[
        {
          label: 'Ideal',
          data: [85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692,85692],
          backgroundColor: 'rgba(227, 58, 62, .0)',
          borderColor: 'rgba(227, 58, 62, 1)',
          borderWidth: 2,
          pointBackgroundColor: 'rgba(255, 255, 255, 1)',
          pointBorderWidth: 2,
          pointRadius: 5,
        },
        {
          label: 'Real',
          data: [70600,45847,41932,40433,50829,103502,89571,50362,43877,175751,51559,53773,48465,57621,40002,88788,39578,63066,69051],
          backgroundColor: 'rgba(71, 196, 254, .2)',
          borderColor: 'rgba(71, 196, 254, 1)',
          borderWidth: 2,
          pointBackgroundColor: 'rgba(255, 255, 255, 1)',
          pointBorderWidth: 2,
          pointRadius: 5,
        },
        {
          label: 'Optimizado',
          data: [86044,87672,76965,71240,84715,98327,114131,77959,72758,106706,82636,87554,75121,98340,82392,94337,73434,86716,100530,77468,84861,81235,92634,78563,92733,88620,75061,98262],
          backgroundColor: 'rgba(137, 218, 89, .2)',
          borderColor: 'rgba(137, 218, 89, 1)',
          borderWidth: 2,
          pointBackgroundColor: 'rgba(255, 255, 255, 1)',
          pointBorderWidth: 2,
          pointRadius: 5,
        }
      ]
    },
    chartOptions: {
      tooltips: {
        mode: 'point'
      },
      maintainAspectRatio: false,
      responsive: true,
    },
  }

  departmentChange = (department) => {
    this.setState({ department });
    console.log(`Option selected:`, department);
  }

  yearChange = (year) => {
    this.setState({ year });
    console.log(this.state.year);
  }

  monthChange = (month) => {
    this.setState({ month });
    console.log(this.state.month);
  }

  handleSubmit = (e, month) => {
    e.preventDefault();
    this.setState(state => ({
      loading: !state.loading
    }));
  }

  // Departamento, Año, Mes

  render() {
    const { department, departmentOptions, year,  worlds, world, yearOptions, month, monthOptions } = this.state;

    return (
      <React.Fragment>
        {this.state.loading && <p>Loading...</p>}
        <div className="col-12 mb-2">
          <div className="card dashboard__filter">
            <form onSubmit={this.handleSubmit}>
              <div className="form-group">
                <Select
                  options={worlds}
                  placeholder={`Departamento`}
                  onChange={this.departmentChange}
                  value={world}
                />
              </div>
              <div className="form-group">
                <Select
                  options={departmentOptions}
                  placeholder={`Año`}
                  onChange={this.yearChange}
                  value={department}
                />
              </div>
              <div className="form-group">
                <Select
                  options={yearOptions}
                  placeholder={`Mes`}
                  onChange={this.monthChange}
                  value={year}
                />
              </div>
              <div className="form-group">
                <Select
                  options={monthOptions}
                  placeholder={`Mes`}
                  onChange={this.monthChange}
                  value={month}
                />
              </div>
              <button className="btn btn-primary" type="submit">Buscar</button>
            </form>
          </div>
        </div>
        <div className="col-12 mb-2">
          <div className="card dashboard__chart">
            <p className="card-text">PRODUCTIVIDAD POR HORA - AUDIO Y VIDEO - ABRIL 2019</p>
          </div>
        </div>
        <div className="col-12 mb-2">
          <div className="card dashboard__chart">
            <div className="dashboard__chart__canvas">
              <Line
                data={this.state.chartData}
                options={this.state.chartOptions}
              />
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}