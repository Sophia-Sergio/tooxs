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
      loading: true,
      result: '',
      worlds : ['Hombre', 'Mujer', 'Niños', 'ElectroHogar', 'Decohogar' ],
      world: 'ElectroHogar',
      departmentDefault: { value: '1', label: 'Alto Las Condes' },
      department: { value: '3', label: 'Audio Video' },
      departmentOptions: [
        { value: '3', label: 'Audio Video' },
        { value: '1', label: 'Computación y Hogar' },
        { value: '2', label: 'Cuidado Personal' }
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
        labels: [],
        datasets:[]
      },
      chartOptions: {
        tooltips: {
          mode: 'point'
        },
        maintainAspectRatio: false,
        responsive: true,
      },
      employees: [],
    }
  }

  componentWillMount(){
    this.createFiltersData();
  }

  componentDidMount(){
    this.getChartData();
    this.getEmployeesData();
  }

  createFiltersData(){
    this.setState({
      store: this.props.stores.map( (store, index) => ({ value: store.id, label: store.name }) )[0],
      storeOptions: this.props.stores.map( store => ({ value: store.id, label: store.name }) ),
      departmentOptions: this.props.departments.map( department => ({ value: department.id, label: department.name }) )
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
    axios.get(`${this.props.root_url}/api/v1/employees/sellers_table?store=${this.state.store.value}&department=${this.state.department.value}&year_start=2019&month_start=3`)
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
    this.getEmployeesData();
  }

  // Departamento, Año, Mes

  render() {
    const { store, storesOptions, department, departmentOptions, year, yearOptions, month, monthOptions, employees } = this.state;

    return (
      <React.Fragment>
        {this.state.loading && <Loader/>}
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
            <h5 className="card-title">Resultado de búsqueda</h5>
            <p className="card-text">Datos desde el 25 de febrero al 7 de marzo de 2019</p>
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