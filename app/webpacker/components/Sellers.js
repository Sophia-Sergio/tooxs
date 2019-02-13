import React, { Component } from 'react';
import axios from 'axios';
import BootstrapTable from 'react-bootstrap-table-next';
import Loader from "./layout/Loader";
import Select from 'react-select';
import paginationFactory from 'react-bootstrap-table2-paginator';
import styled from 'styled-components';
import PropTypes from 'prop-types';
import { currencyFormat } from "./helpers";
import userDefault from '../images/user_default';

class StaffingIndex extends Component {
  constructor(props) {
    super(props);
    this.state = {
      loading: true,
      store: {},
      department: {},
      year: {},
      yearOptions: [],
      month: {},
      monthOptions: [],
      employees: [],
      resultText: '',
    }
  }

  componentWillMount(){
    this.createFiltersData();
  }

  componentDidMount(){
    this.getEmployeesData();
  }

  createFiltersData(){
    var filters = this.props.filters;
    var world = { value: filters.world_selected.id, label: filters.world_selected.name };
    var departments = this.getDepartments(filters.worlds_departments, world);
    var department = this.getBiggerDepartment(filters.worlds_departments, world);
    var monthOptions = this.getMonths(filters.years, filters.year);
    this.setState({
      year: { value: filters.year.value, label: filters.year.label},
      month: { value: filters.month.value, label: filters.month.label},
      store: { value: filters.store.id, label: filters.store.name },
      world: world,
      yearOptions: filters.years.map( year => ({ value: year.value, label: year.label })),
      monthOptions: monthOptions.map( month => ({ value: month.value, label: month.label })),
      worldOptions: filters.worlds_departments.map( world => ({ value: world.id, label: world.name })),
      department: { value: department.id, label: department.name },
      departmentOptions: departments.map( store => ({ value: store.id, label: store.name }) ),
      resultText: `Datos correspondientes al mes de ${this.state.month.label} de ${this.state.year.label}`,
    })
  }

  getEmployeesData = () => {
    this.setState({loading: true});
    var parameters = `type=efficiency&store=${this.state.store.value}&department=${this.state.department.value}&year_start=${this.state.year.value}&month_start=${this.state.month.value}`;
    axios.get(`${this.props.root_url}/api/v1/employees/index?${parameters}`)
      .then(res => {
        this.setState({
          employees: res.data,
        });
        this.setState({
          resultText: `Datos correspondientes al mes de ${this.state.month.label} de ${this.state.year.label}`,
          loading: false
        });
      })
      .catch(error => {
        console.log(error);
      });
  }

  getDepartments = (worlds, world) => {
    for (var w of worlds) {
      if (w['id']==world['value']){
        return w['departments']
      }
    }
  }

  getMonths = (years, year) => {
    for (var y of years) {
      if (y['label']==year['value']){
        return y['months']
      }
    }
  }

  getBiggerDepartment = (worlds, world) => {
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
    this.getEmployeesData();
  }

  render () {
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
      resultText,
    } = this.state;

    const columns = [
      {
        dataField: 'avatar',
        editCellStyle: {
          backgroundColor: '#20B2AA'
        },
        text: 'Foto',
        formatter: (cellContent, row) => (
          <div className="avatar border border-primary rounded-circle" style={{overflow: 'hidden', width: '40px'}}>
            <img src={row.avatar != '' ? row.avatar : userDefault} style={{display: 'block', height: 'auto', width: '100%'}} />
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
        text: 'Tienda',
      },
      {
        dataField: 'department.name',
        text: 'Departamento',
      },
      {
        dataField: 'email',
        text: 'E-mail',
        formatter: (cellContent, row) => (
          <a href={'mailto:' + cellContent}>
            {cellContent}
          </a>
        ),
      },
      {
        dataField: 'shifts',
        text: 'Turno',
      },
      {
        dataField: 'link',
        text: 'Detalle',
        formatter: (cellContent, row) => (
          <a class="btn btn-light btn-sm btn-block" href={cellContent}>
            Ver detalle
          </a>
        ),
      },
    ];
    return (
      <React.Fragment>
        {this.state.loading && <Loader/>}
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
            <p className="card-text">{ resultText }</p>
          </div>
        </div>
        <div className="col-md-12">
          <div className="card dashboard__table">
            <h5 className="card-title">Mis colaboradores</h5>
            <div className="table-responsive">
              <BootstrapTable
                bootstrap4
                bordered={ false }
                columns={ columns }
                data={ employees }
                keyField='id'
                pagination={ paginationFactory() }
              />
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default StaffingIndex;
