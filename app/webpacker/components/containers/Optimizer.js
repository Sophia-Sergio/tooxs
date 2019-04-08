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
    loading: true,
    result: '',
    store: {},
    world: {},
    worldOptions: [],
    department: {},
    year: {},
    yearOptions: [],
    month: {},
    monthOptions: [],
    stats: {},
    chartData: {
      labels: [],
      datasets:[]
    },
  }
  componentWillMount(){
    this.createFiltersData();
  }

  componentDidMount(){
    this.getChartData();
  }

  getChartData = () => {
    this.setState({ loading: true });
    axios.get(`${this.props.root_url}/api/v1/statistics/chart?type=productivity&store=${this.state.store.value}&department=${this.state.department.value}&year_start=2019&month_start=5`)
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

  worldChange = (world) => {
    var departmentOptions = this.getDepartments(this.props.filters.worlds_departments, world)
    var department = this.getBiggerDepartment(this.props.filters.worlds_departments, world)
    this.setState({
      world: world,
      departmentOptions: departmentOptions.map( store => ({ value: store.id, label: store.name }) ),
      department: {value: department.id, label: department.name}
    });
  }

  createFiltersData(){
    var filters = this.props.filters;
    var world = { value: filters.world_selected.id, label: filters.world_selected.name };
    var departments = this.getDepartments(filters.worlds_departments, world);
    var department = this.getBiggerDepartment(filters.worlds_departments, world);
    var monthOptions = this.getMonths(filters.years, filters.year)
    this.setState({
      year: { value: 2019, label: "2019"},
      month: { value: 5, label: "Mayo"},
      store: { value: filters.store.id, label: filters.store.name },
      world: world,
      yearOptions: [{ value: 2019, label: "2019"}],
      monthOptions: monthOptions.map( month => ({ value: month.value, label: month.label })),
      worldOptions: filters.worlds_departments.map( world => ({ value: world.id, label: world.name })),
      department: { value: department.id, label: department.name },
      departmentOptions: departments.map( store => ({ value: store.id, label: store.name }) )
    })
  }

  getDepartments(worlds, world){
    for (var w of worlds) {
      if (w['id']==world['value']){
        return w['departments']
      }
    }
  }

  getMonths(years, year){
    for (var y of years) {
      if (y['label']==year['value']){
        return y['months']
      }
    }
  }

  getBiggerDepartment(worlds, world){
    for (var w of worlds) {
      if (w['id']==world['value']){
        return w['bigger_department']
      }
    }
  }


  storeChange = (store) => {
    this.setState({ store });
  }

  departmentChange = (department) => {
    this.setState({ department });
  }

  yearChange = (year) => {
    var monthOptions = this.getMonths(this.props.filters.years, year)
    this.setState({
      year: year,
      monthOptions: monthOptions
    });
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
    const { department, worldOptions, world, departmentOptions, year, yearOptions, month, monthOptions } = this.state;

    return (
      <React.Fragment>
        {this.state.loading && <Loader/>}
        <div className="col-12 mb-2">
          <div className="card dashboard__filter">
            <form onSubmit={this.handleSubmit}>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={this.worldChange}
                  options={worldOptions}
                  placeholder={`World`}
                  value={world}
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
            <p className="card-text">Datos desde el 29 de abril al 26 de mayo de 2019</p>
          </div>
        </div>
        <div className="col-12 mb-2">
          <div className="card dashboard__chart">
            <Stats/>
            <Chart
              chartData={this.state.chartData}
            />
          </div>
        </div>
        <ProductivityTable/>
        <DotationTable/>
        <DotationPlan/>
      </React.Fragment>
    );
  }
}