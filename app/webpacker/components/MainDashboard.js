import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat } from "./helpers";
import Loader from "./layout/Loader";
import Select from 'react-select';
import {Line} from 'react-chartjs-2';
import { merge } from 'lodash';
import Stats from './Stats';
import ShiftPlan from './dashboard/ShiftPlan';
import EmployeesTable from './dashboard/EmployeesTable';

class MainDashboard extends Component {
  constructor(props){
    super(props);
    this.state = {
      loading: true,
      result: '',
      store: {},
      storeOptions: [],
      department: {},
      departmentOptions: [],
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

  componentDidMount = () => {
    this.createFiltersData();
    this.getChartData();
    this.getEmployeesData();
  }

  createFiltersData(){
    this.setState({
      store: this.props.stores.map( (store, index) => ({ value: store.id, label: store.name }) )[0],
      storeOptions: this.props.stores.map( store => ({ value: store.id, label: store.name }) ),
      department: this.props.departments.map( department => ({ value: department.id, label: department.name }) )[0],
      departmentOptions: this.props.departments.map( department => ({ value: department.id, label: department.name }) )
    })
  }

  getChartData(){
    this.setState({loading: true});
    axios.get(`${this.props.root_url}/api/v1/statistics/graph?type=efficiency&store=${this.state.store.value}&department=${this.state.department.value}&year_start=2018&month_start=7`)
      .then(res => {
        this.setState({chartData: res.data, loading: false});
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
    axios.get(`${this.props.root_url}/api/v1/employees/sellers_table?store=${this.state.store.value}&department=${this.state.department.value}&year_start=2018&month_start=7`)
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
    getChartData();
    getEmployeesData();
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
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={this.storeChange}
                  options={storesOptions}
                  placeholder={`Tienda`}
                  value={store}
                />
              </div>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={this.departmentChange}
                  options={departmentOptions}
                  placeholder={`Departamento`}
                  value={department}
                />
              </div>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={this.yearChange}
                  options={yearOptions}
                  placeholder={`Año`}
                  value={year}
                />
              </div>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={this.monthChange}
                  options={monthOptions}
                  placeholder={`Mes`}
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
            <p className="card-text">Datos desde el 30 de abril al 27 de mayo de 2018</p>
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
        <ShiftPlan/>
        <EmployeesTable employees={employees}/>
      </React.Fragment>
    );
  }
}

export default MainDashboard;