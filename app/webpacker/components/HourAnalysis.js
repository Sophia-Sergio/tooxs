import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat } from "./helpers";
import Select from 'react-select';
import {Line} from 'react-chartjs-2';
import { merge } from 'lodash';
import ProductivityTable from './hour_analysis/ProductivityTable';
import DetailTable from './hour_analysis/DetailTable';

class ComparativeSales extends Component {
  constructor(props){
    super(props);
    this.state = {
      loading: false,
      result: '',
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
      month: { value: '5', label: 'Mayo' },
      monthOptions: [
        { value: '4', label: 'Abril' },
        { value: '5', label: 'Mayo' },
        { value: '6', label: 'Junio' },
        { value: '7', label: 'Julio' },
        { value: '8', label: 'Agosto' },
        { value: '9', label: 'Septiembre' },
        { value: '10', label: 'Octubre' },
        { value: '11', label: 'Noviembre' },
        { value: '12', label: 'Diciembre' }
      ],
      chartData: {
        labels: ["25-03","26-03","27-03","28-03","29-03", "30-31","01-04","02-04","03-04","04-04",
                  "05-04","06-04","07-04","08-04","09-04","10-04","11-04","12-04","13-04","14-04","15-04","16-04","17-04","18-04","19-04","20-04","21-04","22-04"],
        datasets:[
          {
            label: 'Real',
            data: [78,109,145,148,145,76,79,113,131,34,117,127,155,128,138,68,154,99,99,76,79,113,131,117,127,155,128,138],
            backgroundColor: 'rgba(71, 196, 254, .2)',
            borderColor: 'rgba(71, 196, 254, 1)',
            borderWidth: 2,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderWidth: 2,
            pointRadius: 5,
          },
          {
            label: 'Optimizado',
            data:[64,57,79,84,87,80,62,73,79,56,73,78,100,75,67,64,83,72,68,96,87,70,62,76,65,77,100,75],
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
  }

  componentWillMount(){
  }

  getChartData(){
    // Ajax calls here
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
    axios.get(`${this.props.root_url}/api/v1/statistics/chart?type=efficiency&store=13&department=3&year_start=2019&month_start=${this.state.month.value}`)
      .then(res => {
        this.setState({chartData: res.data, loading: false})
    })
  }

  // Departamento, Año, Mes

  render() {
    const { department, departmentOptions, worlds, world, year, yearOptions, month, monthOptions } = this.state;

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
            <h5 className="card-title">Resultado de búsqueda</h5>
            <p className="card-text">Análisis de horas: { department.label } - { month.label } del año { year.value }</p>
          </div>
        </div>
        <div className="col-12 mb-2">
          <div className="card dashboard__chart">
          <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
              <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Horas</a>
              <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Pesos</a>
            </div>
          </nav>
            <div className="dashboard__chart__canvas">
              <Line
                data={this.state.chartData}
                options={this.state.chartOptions}
              />
            </div>
          </div>
        </div>
        <ProductivityTable/>
        <DetailTable/>
      </React.Fragment>
    );
  }
}

export default ComparativeSales;