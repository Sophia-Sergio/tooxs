import React, { Component } from 'react';
import axios from 'axios';
import BootstrapTable from 'react-bootstrap-table-next';
import Loader from '../components/UI/Loader';
import Select from 'react-select';
import paginationFactory from 'react-bootstrap-table2-paginator';
import styled from 'styled-components';
import PropTypes from 'prop-types';
import { getPeriod } from '../lib/helpers';
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
import userDefault from '../../images/user_default';
import Period from '../components/Period';

export default class Employees extends Component {
  state = {
    loading: true,
    store: {},
    department: {},
    year: {},
    yearOptions: [],
    month: {},
    monthOptions: [],
    employees: [],
    period: ''
  };

  componentWillMount() {
    createFiltersData(this);
  }

  componentDidMount() {
    this.getEmployeesData();
  }

  getEmployeesData = () => {
    this.setState({ loading: true });
    var parameters = `type=efficiency&store=${
      this.state.store.value
    }&department=${this.state.department.value}&year_start=${
      this.state.year.value
    }&month_start=${this.state.month.value}`;
    axios
      .get(`${this.props.root_url}/api/v1/employees/index?${parameters}`)
      .then(res => {
        this.setState({
          employees: res.data
        });
        this.setState({
          loading: false
        });
        getPeriod(this);
      })
      .catch(error => {
        console.log(error);
      });
  };

  handleSubmit = (e, month) => {
    e.preventDefault();
    this.getEmployeesData();
  };

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
      employees,
      period
    } = this.state;

    const columns = [
      {
        dataField: 'avatar',
        editCellStyle: {
          backgroundColor: '#20B2AA'
        },
        text: 'Foto',
        formatter: (cellContent, row) => (
          <div
            className="avatar border border-primary rounded-circle"
            style={{ overflow: 'hidden', width: '40px' }}
          >
            <img
              src={row.avatar != '' ? row.avatar : userDefault}
              style={{ display: 'block', height: 'auto', width: '100%' }}
            />
          </div>
        ),
        style: {
          width: '40px'
        }
      },
      {
        dataField: 'name',
        text: 'Nombre',
        sort: true
      },
      {
        dataField: 'surname_1',
        text: 'Apellido',
        sort: true
      },
      {
        dataField: 'rut',
        text: 'Rut',
        sort: true
      },
      {
        dataField: 'store.name',
        text: 'Tienda'
      },
      {
        dataField: 'department.name',
        text: 'Departamento'
      },
      {
        dataField: 'email',
        text: 'E-mail',
        formatter: (cellContent, row) => (
          <a href={'mailto:' + cellContent}>{cellContent}</a>
        )
      },
      {
        dataField: 'shifts',
        text: 'Turno'
      },
      {
        dataField: 'link',
        text: 'Detalle',
        formatter: (cellContent, row) => (
          <a class="btn btn-light btn-sm btn-block" href={cellContent}>
            Ver detalle
          </a>
        )
      }
    ];
    return (
      <React.Fragment>
        {this.state.loading && <Loader />}
        {this.state.loading && <Loader />}
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
              <button className="btn btn-primary" type="submit">
                Buscar
              </button>
            </form>
          </div>
        </div>
        <Period period={period} />
        <div className="col-md-12">
          <div className="card dashboard__table">
            <h5 className="card-title">Mis colaboradores</h5>
            <div className="table-responsive">
              <BootstrapTable
                bootstrap4
                bordered={false}
                columns={columns}
                data={employees}
                keyField="id"
                pagination={paginationFactory()}
              />
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}
