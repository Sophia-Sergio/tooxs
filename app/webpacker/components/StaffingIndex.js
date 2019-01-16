import React, { Component } from 'react';
import BootstrapTable from 'react-bootstrap-table-next';
import Select from 'react-select';
import paginationFactory from 'react-bootstrap-table2-paginator';
import styled from 'styled-components';
import PropTypes from 'prop-types';
import { currencyFormat } from "./helpers";
import userDefault from '../images/user_default';

class StaffingIndex extends Component {
  state = {
    loading: true,
    result: '',
    store: { value: '12', label: 'Alto Las Condes' },
    storeOptions: [],
    department: { value: '12', label: 'Juvenil mujer' },
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
    employees: [
      {id:5, name:"Jorge",last_name: "Marroquín", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'Turno 1 de 45 horas', sell: 55503480, goal: 153000000.0, objective: 0.36, link: "/sellers/5"},
      {id:6, name:"Patricio",last_name: "Corona", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'Turno 1 de 45 horas', sell: 97038214, goal: 497250000.0, objective: 0.2, link: "/sellers/6"},
      {id:7, name:"José",last_name: "Castro", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'Turno 1 de 45 horas', sell: 100168950, goal: 382500000.0, objective: 0.26, link: "/sellers/7"},
      {id:8, name:"Ana Luisa",last_name: "Fierro", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'Turno 1 de 45 horas', sell: 114111025, goal: 382500000.0, objective: 0.3, link: "/sellers/8"},
      {id:9, name:"Ignacio",last_name: "León", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'Turno 1 de 45 horas', sell: 49763360, goal: 306000000.0, objective: 0.16, link: "/sellers/9"},
      {id:10, name:"Ricardo",last_name: "Rojo", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'Turno 1 de 45 horas', sell: 97038214, goal: 497250000.0, objective: 0.2, link: "/sellers/10"},
      {id:11, name:"Roberto",last_name: "Bétancourt", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'Turno 1 de 45 horas', sell: 96561550, goal: 382500000.0, objective: 0.25, link: "/sellers/11"},
      {id:12, name:"José",last_name: "Acuña", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'Turno 1 de 45 horas', sell: 90971900, goal: 478125000.0, objective: 0.19, link: "/sellers/12"},
      {id:13, name:"Jesús",last_name: "Márquez", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'Turno 1 de 45 horas', sell: 49763360, goal: 306000000.0, objective: 0.16, link: "/sellers/13"},
      {id:14, name:"Sergio",last_name: "Montero", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'Turno 1 de 45 horas', sell: 90887030, goal: 351900000.0, objective: 0.26, link: "/sellers/14"},
      {id:15, name:"Diego",last_name: "Montemayor", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'Turno 1 de 45 horas', sell: 114111025, goal: 382500000.0, objective: 0.3, link: "/sellers/15"},
      {id:16, name:"Gregorio",last_name: "Alonso", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'Turno 1 de 45 horas', sell: 96561550, goal: 382500000.0, objective: 0.25, link: "/sellers/16"}
    ]
  }
  render () {
    const { store, storesOptions, department, departmentOptions, year, yearOptions, month, monthOptions, employees } = this.state;
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
        dataField: 'last_name',
        text: 'Apellido',
        sort: true
      },
      {
        dataField: 'rut',
        text: 'Rut',
      },
      {
        dataField: 'store',
        text: 'Tienda',
      },
      {
        dataField: 'department',
        text: 'Departamento',
      },
      {
        dataField: 'shift',
        text: 'Turno',
      },
      {
        dataField: 'link',
        text: 'Cumplimiento',
        formatter: (cellContent) => (
          <a href={ cellContent } alt="">Detalle</a>
        ),
      },
    ];
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
            <p className="card-text">Datos desde el 30 de abril al 27 de mayo de 2018</p>
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
