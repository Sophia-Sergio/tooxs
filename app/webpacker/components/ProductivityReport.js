import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat } from "./helpers";
import Select from 'react-select';
import {Line} from 'react-chartjs-2';
import { merge } from 'lodash';
import ProductivityTable from './productivity_report/ProductivityTable';
import EfficiencyTable from './productivity_report/EfficiencyTable';

class ProductivityReport extends Component {
  constructor(props){
    super(props);
    this.state = {
      loading: false,
      worlds : ['Hombre', 'Mujer', 'Niños', 'ElectroHogar', 'Decohogar' ],
      worlds: 'ElectroHogar'
      departmentDefault: { value: '1', label: 'Alto Las Condes' },
      department: { value: '1', label: 'Audio Video' },
      departmentOptions: [
        { value: '1', label: 'Audio Video' },
        { value: '2', label: 'Computación y Hogar' },
        { value: '3', label: 'Cuidado Personal' }
      ],
      year: { value: '2018', label: '2018' },
      yearOptions: [
        { value: '2018', label: '2018' },
        { value: '2017', label: '2017' },
        { value: '2016', label: '2016' }
      ],
      month: { value: '3', label: 'Marzo' },
      monthOptions: [
        { value: '3', label: 'Marzo' },
        { value: '5', label: 'Abril' },
        { value: '5', label: 'Mayo' },
        { value: '6', label: 'Junio' },
        { value: '7', label: 'Julio' }
        { value: '8', label: 'Agosto' },
        { value: '9', label: 'septiembre' },
        { value: '10', label: 'Octubre' },
        { value: '11', label: 'Noviembre' },
        { value: '12', label: 'Diciembre' }

      ],
      chartData: {
        labels: ["25","26","27","28","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"],
        datasets:[
          {
            label: 'PLan',
            data: [70600,45847,41932,40433,50829,103502,89571,50362,43877,175751,51559,53773,48465,57621,40002,88788,39578,63066,69051,47369,65919,69347,179479,38771,95677,53730,46334,57575],
            backgroundColor: 'rgba(227, 58, 62, 1)',
            borderColor: 'rgba(227, 58, 62, 1)',
            borderWidth: 2,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderWidth: 2,
            pointRadius: 5,
          },
          {
            label: 'Real',
            data: [70600,45847,41932,40433,50829,103502,89571,50362,43877,175751,51559,53773,48465,57621,40002,88788,39578,63066,69051,47369,65919,69347,179479,38771,95677,53730,46334,57575],
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
    axios.get(`${this.props.root_url}/api/v1/statistics/graph?type=efficiency&store=13&department=${this.state.department.value}&year_start=2018&month_start=${this.state.month.value}`)
      .then(res => {
        this.setState({chartData: res.data, loading: false})
    })
  }

  // Departamento, Año, Mes

  render() {
    const { department, departmentOptions, year, yearOptions, month, monthOptions } = this.state;

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
                  options={departments}
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
            <p className="card-text">PRODUCTIVIDAD POR HORA - ALTO LAS CONDES - JUVENIL MUJER</p>
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
        <ProductivityTable/>
        <EfficiencyTable/>
      </React.Fragment>
    );
  }
}

export default ProductivityReport;