import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat } from "./helpers";
import Loader from "./layout/Loader";
import Select from 'react-select';
import {Line} from 'react-chartjs-2';
import { merge } from 'lodash';
import Stats from './productivity/Stats';
import ProductivityTable from './productivity/ProductivityTable';
import DotationTable from './productivity/DotationTable';
import DotationPlan from './productivity/DotationPlan';

class ProductivityShow extends Component {
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
        { value: '9', label: 'septiembre' },
        { value: '10', label: 'Octubre' },
        { value: '11', label: 'Noviembre' },
        { value: '12', label: 'Diciembre' }
      ],
      chartData: {
        labels: ["25-03","26-03","27-03","28-03","29-03", "30-31","01-04","02-04","03-04","04-04",
                  "05-04","06-04","07-04","08-04","09-04","10-04","11-04","12-04","13-04","14-04","15-04","16-04","17-04","18-04","19-04","20-04","21-04","22-04"],
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
            label: 'Sin Optimizar',
            data: [70600,45847,41932,40433,50829,103502,89571,50362,43877,175751,51559,53773,48465,57621,40002,88788,39578,63066,69051,48465,57621,40002,88788,48465,63066,125751, 69051,85188],
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
    this.createFiltersData();
  }

  componentDidMount(){
    //this.getChartData();
  }

  createFiltersData(){
    this.setState({
      store: this.props.stores.map( (store, index) => ({ value: store.id, label: store.name }) )[0],
      storeOptions: this.props.stores.map( store => ({ value: store.id, label: store.name }) ),
    })
  }

  getChartData(){
    this.setState({loading: true});
    axios.get(`${this.props.root_url}/api/v1/statistics/chart?type=efficiency&store=${this.state.store.value}&department=${this.state.department.value}&year_start=2019&month_start=3`)
      .then(res => {
        this.setState(state => {
          state.chartData.datasets[0].backgroundColor = 'rgba(71, 196, 254, .2)';
          state.chartData.datasets[0].borderColor = 'rgba(71, 196, 254, 1)';
          state.chartData.datasets[0].borderWidth = 2;
          state.chartData.datasets[0].pointBackgroundColor = 'rgba(255, 255, 255, 1)';
          state.chartData.datasets[0].pointBorderWidth = 2;
          state.chartData.datasets[0].pointRadius = 5;
          state.chartData.datasets[1].backgroundColor = 'rgba(137, 218, 89, .2)';
          state.chartData.datasets[1].borderColor = 'rgba(137, 218, 89, 1)';
          state.chartData.datasets[1].borderWidth = 2;
          state.chartData.datasets[1].pointBackgroundColor = 'rgba(255, 255, 255, 1)';
          state.chartData.datasets[1].pointBorderWidth = 2;
          state.chartData.datasets[1].pointRadius = 5;
          return state
        })
      })
      .catch(error => {
        console.log(error);
        this.setState({
          loading: false,
          errors: {
            result: 'No se econtraron coincidencias.'
          }
        })
      });
  }

  getEmployeesData(){
    // Ajax calls here
    axios.get(`${this.props.root_url}/api/v1/employees/sellers_table?store=${this.state.store.value}&department=3&year_start=2019&month_start=3`)
      .then(res => {
        this.setState({employees: res.data});
      })
      .catch(error => {
        console.log(error);
      });
  }

  storeChange = (department) => {
    this.setState({ store });
    console.log(this.state.store);
  }

  departmentChange = (department) => {
    this.setState({ department });
    console.log(this.state.department);
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
    this.getChartData();
  }

  // Departamento, Año, Mes

  render() {
    const { store, storesOptions, department, worlds, world, departmentOptions, year, yearOptions, month, monthOptions } = this.state;

    return (
      <React.Fragment>
        {this.state.loading && <Loader/>}
        <div className="col-12 mb-2">
          <div className="card dashboard__filter">
            <form onSubmit={this.handleSubmit}>
              <div className="form-group">
                <Select
                  options={worlds}
                  placeholder={`Mundo`}
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
            <p className="card-text">Datos desde el 30 de abril al 29 de mayo de 2019</p>
          </div>
        </div>
        <div className="col-12 mb-2">
          <div className="card dashboard__chart">
            <Stats/>
            <div className="dashboard__chart__canvas">
              <Line
                data={this.state.chartData}
                options={this.state.chartOptions}
              />
            </div>
          </div>
        </div>
        <ProductivityTable/>
        <DotationTable/>
        <DotationPlan/>
      </React.Fragment>
    );
  }
}

export default ProductivityShow;