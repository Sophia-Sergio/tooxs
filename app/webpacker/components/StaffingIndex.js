import React, { Component } from 'react';
import PropTypes from 'prop-types';
import axios from 'axios';
import Select from 'react-select';
import StaffingMonth from './staffing/StaffingMonth';

class StaffingIndex extends Component {
  state = {
    loading: true,
    result: '',
    store: { value: '12', label: 'Alto Las Condes' },
    storeOptions: [
      { value: '12', label: 'Alto Las Condes' }
    ],
    department: { value: '12', label: 'Juvenil mujer' },
    departmentOptions: [
      { value: '12', label: 'Juvenil mujer' }
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
    week_days: ['L', 'M', 'M', 'J', 'V', 'S', 'D'],
    weeks: [],
  }

  componentWillMount = () => {
    this.getDates();
  }

  getDates = () => {
    var parameters = `store=${'13'}&department=${'1'}&year_start=${'2018'}&month_start=${'11'}`;
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
        console.log(weeks);
        this.setState({
          weeks: weeks,
        });
      })
      .catch(error => {
        console.log(error);
      });
  }

  render () {
    const { store, storesOptions, department, departmentOptions, year, yearOptions, month, monthOptions, weeks } = this.state;
    return (
      <React.Fragment>
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

export default StaffingIndex
