import React, { Component } from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';
import Loader from '../components/UI/Loader';
import Select from 'react-select';
import { getPeriod } from '../lib/helpers';
import Period from '../components/Period';
import {
  createFiltersData1 as createFiltersData,
  worldChange,
  getDepartments,
  getBiggerDepartment,
  getMonths,
  yearChange,
  departmentChange,
  monthChange
} from '../lib/filters';
import Filter from '../components/staff/Filter';
import StaffingMonth from '../components/staff/StaffingMonth';

export default class Staff extends Component {

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
    createFiltersData(this);
  }

  componentDidMount = () => {
    this.getDates();
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
        getPeriod(this);
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
                  onChange={node => worldChange(node, this)}
                  options={worldOptions}
                  placeholder={`World`}
                  value={world}
                />
              </div>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={node => departmentChange(node, this)}
                  options={departmentOptions}
                  placeholder={`Departamento`}
                  value={department}
                />
              </div>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={node => yearChange(node, this)}
                  options={yearOptions}
                  placeholder={`Año`}
                  value={year}
                />
              </div>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={node => monthChange(node, this)}
                  options={monthOptions}
                  placeholder={`Mes`}
                  value={month}
                />
              </div>
              <button className="btn btn-primary" type="submit">Buscar</button>
            </form>
          </div>
        </div>
        <Period period={period} />
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
