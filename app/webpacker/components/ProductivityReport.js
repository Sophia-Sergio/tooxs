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
      departmentDefault: { value: '1', label: 'Alto Las Condes' },
      department: { value: '1', label: 'Alto Las Condes' },
      departmentOptions: [
        { value: '1', label: 'Alto Las Condes' },
        { value: '2', label: 'Parque Arauco' },
        { value: '3', label: 'Costanera Center' }
      ],
      year: { value: '2018', label: '2018' },
      yearOptions: [
        { value: '2018', label: '2018' },
        { value: '2017', label: '2017' },
        { value: '2016', label: '2016' }
      ],
      month: { value: '7', label: 'Julio' },
      monthOptions: [
        { value: '7', label: 'Julio' },
        { value: '6', label: 'Junio' },
        { value: '5', label: 'Mayo' }
      ],
      chartData: {
        labels: ["30","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27"],
        datasets:[
          {
            label: 'Productividad ideal',
            data: [112519,128689,84295,69944,67057,69808,89035,98868,92201,120709,79741,74325,52310,70009,103774,109434,77564,81665,84412,59228,59755,99227,114105,84623,87401,73084,54130,71460],
            backgroundColor: 'rgba(71, 196, 254, .2)',
            borderColor: 'rgba(71, 196, 254, 1)',
            borderWidth: 2,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderWidth: 2,
            pointRadius: 5,
          },
          {
            label: 'Real',
            data: [112519,128689,84295,69944,67057,69808,89035,98868,92201,120709,79741,74325,52310,70009,103774,109434,77564,81665,84412,59228,59755,99227,114105,84623,87401,73084,54130,71460],
            backgroundColor: 'rgba(71, 196, 254, .2)',
            borderColor: 'rgba(71, 196, 254, 1)',
            borderWidth: 2,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderWidth: 2,
            pointRadius: 5,
          },
          {
            label: 'Optimizado',
            data:[112519,128689,84295,69944,67057,69808,89035,98868,92201,120709,79741,74325,52310,70009,103774,109434,77564,81665,84412,59228,59755,99227,114105,84623,87401,73084,54130,71460],
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
                  options={departmentOptions}
                  placeholder={`Departamento`}
                  onChange={this.departmentChange}
                  value={department}
                />
              </div>
              <div className="form-group">
                <Select
                  options={yearOptions}
                  placeholder={`Año`}
                  onChange={this.yearChange}
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