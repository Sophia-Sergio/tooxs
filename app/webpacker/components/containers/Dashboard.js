import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat, monthFormat, dayMonthFormat } from '../helpers';
import Loader from '../components/UI/Loader';
import Select from 'react-select';
import {Line} from 'react-chartjs-2';
import { merge } from 'lodash';
import Stats from '../Stats';
import ShiftPlan from '../components/dashboard/ShiftPlan';
import EmployeesTable from '../components/dashboard/EmployeesTable';


export default class Dashboard extends Component {
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
    chartOptions: {
      tooltips: {
        mode: 'point'
      },
      maintainAspectRatio: false,
      responsive: true,
    },
    sales_assistants: [],
    sellers: [],
    employeesData: {},
    period: ''
  }

  componentWillMount(){
    this.createFiltersData();
  }

  componentDidMount(){
    this.getComponentData();
  }

  getPeriod(){
    var parameters = `year_start=${this.state.year.value}&month_start=${this.state.month.value}`;
    axios.get(`${this.props.root_url}/api/v1/periods/filter_period?${parameters}`)
      .then(res => {
        const start = new Date(res.data.start);
        const startYear = start.getFullYear();
        const startMonth = start.getMonth();
        const startDay = start.getDate();
        const end = new Date(res.data.end);
        const endYear = end.getFullYear();
        const endMonth = end.getMonth();
        const endDay = end.getDate();
        this.setState({
          period: `Datos desde el ${ startDay + 1} de ${ monthFormat(startMonth + 1) } de ${ startYear } al ${ endDay +1 } de ${ monthFormat(endMonth + 1) } de ${ endYear }`,
        });
        this.setState({loading: false});
      })
      .catch(error => {
        console.log(error);
      });
  }

  getChartData(parameters){
    axios.get(`${this.props.root_url}/api/v1/statistics/chart?${parameters}`).then(response => {
      this.setState({
        chartData: response.data,
      });
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
      });
      this.getEmployeesData(parameters);
    }).catch(error => {
      console.log(error);
    });
  }

  getStatsData(parameters){
    axios.get(`${this.props.root_url}/api/v1/statistics/summary?${parameters}`).then(response => {
      this.setState({
        stats: response.data,
      });
      this.getChartData(parameters)
    }).catch(error => {
      console.log(error);
    });
  }

  getEmployeesData(parameters){
    axios.get(`${this.props.root_url}/api/v1/employees/table?${parameters}`).then(response => {
      this.setState({
        sales_assistants: response.data.sales_assistants ? response.data.sales_assistants : [],
        sellers: response.data.sellers ? response.data.sellers : [],
      });
      this.getPeriod();
    }).catch(error => {
      console.log(error);
    });
  }

  getComponentData = () => {
    this.setState({loading: true});
    let parameters = `type=efficiency&store=${this.state.store.value}&department=${this.state.department.value}&year_start=${this.state.year.value}&month_start=${this.state.month.value}`;
    this.getStatsData(parameters);
  }

  createFiltersData(){
    var filters = this.props.filters;
    var world = { value: filters.world_selected.id, label: filters.world_selected.name };
    var departments = this.getDepartments(filters.worlds_departments, world);
    var department = this.getBiggerDepartment(filters.worlds_departments, world);
    var monthOptions = this.getMonths(filters.years, filters.year)
    this.setState({
      year: { value: filters.year.value, label: filters.year.label},
      month: { value: filters.month.value, label: filters.month.label},
      store: { value: filters.store.id, label: filters.store.name },
      world: world,
      yearOptions: filters.years.map( year => ({ value: year.value, label: year.label })),
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

  worldChange = (world) => {
    var departmentOptions = this.getDepartments(this.props.filters.worlds_departments, world)
    var department = this.getBiggerDepartment(this.props.filters.worlds_departments, world)
    this.setState({
      world: world,
      departmentOptions: departmentOptions.map( store => ({ value: store.id, label: store.name }) ),
      department: {value: department.id, label: department.name}
    });
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
    this.getComponentData();
  }

  render() {
    const {
      world,
      store,
      storesOptions,
      department,
      departmentOptions,
      worldOptions,
      year,
      yearOptions,
      month,
      monthOptions,
      stats,
      sales_assistants,
      sellers,
      period

     } = this.state;

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
            <p className="card-text">{period}</p>
          </div>
        </div>
        <div className="col-12 mb-2">
          <div className="card dashboard__chart">
            <Stats {...stats} />
            <h5 className="secondary-title">Gráfico de eficiencia</h5>
            <div className="dashboard__chart__canvas">
              <Line
                data={this.state.chartData}
                options={this.state.chartOptions}
              />
            </div>
          </div>
        </div>
        <ShiftPlan/>
        <EmployeesTable
          sales_assistants={sales_assistants}
          sellers={sellers}
        />
      </React.Fragment>
    );
  }
}
