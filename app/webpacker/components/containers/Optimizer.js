import React, {Component} from 'react';
import axios from 'axios';
import Loader from '../components/UI/Loader';
import Select from 'react-select';
import Chart from '../components/UI/Chart';
import { merge } from 'lodash';
import Stats from '../productivity/Stats';
import ProductivityTable from '../productivity/ProductivityTable';
import DotationTable from '../productivity/DotationTable';
import DotationPlan from '../productivity/DotationPlan';

export default class Optimizer extends Component {
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
    chartData: {}
  }

  componentWillMount(){
    this.createFiltersData();
  }

  componentDidMount(){
    this.getChartData();
  }

  createFiltersData(){
    this.setState({
      store: this.props.stores.map( (store, index) => ({ value: store.id, label: store.name }) )[0],
      storeOptions: this.props.stores.map( store => ({ value: store.id, label: store.name }) ),
    })
  }

  getChartData = () => {
    this.setState({ loading: true });
    console.log(`${this.props.root_url}/api/v1/statistics/chart?type=productivity&store=${this.state.store.value}&department=${this.state.department.value}&year_start=2019&month_start=4`)
    axios.get(`${this.props.root_url}/api/v1/statistics/chart?type=productivity&store=${this.state.store.value}&department=${this.state.department.value}&year_start=2019&month_start=4`)
      .then(res => {
        this.setState({
          isCompared: false,
          summary: res.data.summary,
          loading: false,
          chartData: {
            ...res.data.chart,
            labels: res.data.chart.labels
          }
        });
      })
      .catch(error => {
        this.setState({
          loading: false
        });
      });
  }

  getEmployeesData(){
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
  }

  departmentChange = (department) => {
    this.setState({ department });
  }

  yearChange = (year) => {
    this.setState({ year });
  }

  monthChange = (month) => {
    this.setState({ month });
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
              <Chart
                chartData={this.state.chartData}
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