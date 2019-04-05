import React, { Component } from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';
import Loader from '../components/UI/Loader';
import Select from 'react-select';
import { getDepartments, getBiggerDepartment, monthFormat } from '../helpers';
import Filter from '../components/staff/Filter';
import StaffingMonth from '../components/staff/StaffingMonth';

export default class Staf extends Component {

  state = {
    loading: false,
    store: {},
    department: {},
    year: {},
    yearOptions: [],
    month: {},
    monthOptions: [],
    period: '',
    weeks: [],
  }

  componentWillMount = () => {
    this.createFiltersData();
  }

  componentDidMount = () => {
    this.getDates();
  }

  createFiltersData = () => {
    var filters = this.props.filters;
    var world = { value: filters.world_selected.id, label: filters.world_selected.name };
    var departments = getDepartments(filters.worlds_departments, world);
    var department = getBiggerDepartment(filters.worlds_departments, world);
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

  getMonths(years, year){
    for (var y of years) {
      if (y['label']==year['value']){
        return y['months']
      }
    }
  }

  worldChange = (world) => {
    var departmentOptions = getDepartments(this.props.filters.worlds_departments, world)
    var department = getBiggerDepartment(this.props.filters.worlds_departments, world)
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
    this.getDates();
  }

  getDates = () => {
    var parameters = `store=${this.state.store.value}&department=${this.state.department.value}&year_start=${this.state.year.value}&month_start=${this.state.month.value}`;
    this.setState({ loading: true });
    axios.get(`${this.props.root_url}/api/v1/employees/staff?${parameters}`)
      .then(res => {
        const data = res.data;
        const weeks = [];
        const size = 7;
        let index = 0;
        while (index < data.length) {
          weeks.push(data.slice(index, size + index));
          index += size;
        }
        this.setState({
          loading: false,
          weeks: weeks,
        });
        this.getPeriod();
      })
      .catch(error => {
        console.log(error);
      });
  }

  getPeriod = () => {
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
          period: `Datos desde el ${ startDay } de ${ monthFormat(startMonth + 1) } de ${ startYear } al ${ endDay } de ${ monthFormat(endMonth + 1) } de ${ endYear }`,
        });
      })
      .catch(error => {
        console.log(error);
      });
  }

  render () {
    const { store, storesOptions, world, worldOptions, department, departmentOptions,
      year, yearOptions, month, monthOptions, period, week_days, weeks
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
            <h5 className="card-title">Resultado de búsqueda</h5>
            <p className="card-text">{ period }</p>
          </div>
        </div>
        {weeks.map( (week, index) => (
          <StaffingMonth
            key={index}
            week_name={`Semama ${ index + 1 }`}
            week={week}
          />
        ))}
      </React.Fragment>
    );
  }
}
