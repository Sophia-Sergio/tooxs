import React, { Component } from 'react';
import Select from 'react-select';
import BootstrapTable from 'react-bootstrap-table-next';
import styled from 'styled-components';
import PropTypes from 'prop-types';
import { currencyFormat } from "./helpers";
import userDefault from '../images/user_default';
import ShiftPlan from './sellers/ShiftPlan';
import AvailableShifts from './sellers/AvailableShifts';

class StaffingIndex extends Component {
  state = {
    loading: true,
    result: '',
    store: { value: '12', label: 'Alto Las Condes' },
    storeOptions: [],
    department: { value: '12', label: 'Juvenil mujer' },
    departmentOptions: [],
    year: { value: '2019', label: '2019' },
    yearOptions: [
      { value: '2019', label: '2019' },
      { value: '2018', label: '2018' }
    ],
    month: { value: '3', label: 'Marzo' },
    monthOptions: [
      { value: '3', label: 'Marzo' },
      { value: '4', label: 'Abril' },
      { value: '5', label: 'Mayo' },
      { value: '6', label: 'Junio' },
      { value: '7', label: 'Julio' },
      { value: '8', label: 'Agosto' },
      { value: '9', label: 'Septiembre' },
      { value: '10', label: 'Octubre' },
      { value: '11', label: 'Noviembre' },
      { value: '12', label: 'Diciembre' }
    ],
    employees: [
      {id:5, name:"Jorge",last_name: "Marroquín", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'T1', current_shift_desc: 'Turno 1 de 45 horas', next_shift: 'T1', next_shift_desc: 'Turno 1 de 45 horas'},
      {id:6, name:"Patricio",last_name: "Corona", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'T1', current_shift_desc: 'Turno 1 de 45 horas', next_shift: '', next_shift_desc: ''},
      {id:7, name:"José",last_name: "Castro", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'T1', current_shift_desc: 'Turno 1 de 45 horas', next_shift: 'T2', next_shift_desc: 'Turno 2 de 45 horas'},
      {id:8, name:"Ana Luisa",last_name: "Fierro", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'T1', current_shift_desc: 'Turno 1 de 45 horas', next_shift: '', next_shift_desc: ''},
      {id:9, name:"Ignacio",last_name: "León", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'T1', current_shift_desc: 'Turno 1 de 45 horas', next_shift: 'T3', next_shift_desc: 'Turno 3 de 45 horas'},
      {id:10, name:"Ricardo",last_name: "Rojo", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'T1', current_shift_desc: 'Turno 1 de 45 horas', next_shift: '', next_shift_desc: ''},
      {id:11, name:"Roberto",last_name: "Bétancourt", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'T1', current_shift_desc: 'Turno 1 de 45 horas', next_shift: 'T4', next_shift_desc: 'Turno 4 de 45 horas'},
      {id:12, name:"José",last_name: "Acuña", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'T1', current_shift_desc: 'Turno 1 de 45 horas', next_shift: '', next_shift_desc: ''},
      {id:13, name:"Jesús",last_name: "Márquez", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'T1', current_shift_desc: 'Turno 1 de 45 horas', next_shift: 'T5', next_shift_desc: 'Turno 1 de 36 horas'},
      {id:14, name:"Sergio",last_name: "Montero", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'T1', current_shift_desc: 'Turno 1 de 45 horas', next_shift: 'T5', next_shift_desc: 'Turno 1 de 36 horas'},
      {id:15, name:"Diego",last_name: "Montemayor", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'T1', current_shift_desc: 'Turno 1 de 45 horas', next_shift: '', next_shift_desc: ''},
      {id:16, name:"Gregorio",last_name: "Alonso", avatar: "", rut: '12.222.008-7', store: 'Alto Las Condes', department: 'Juvenil mujer', shift: 'T1', current_shift_desc: 'Turno 1 de 45 horas', next_shift: '', next_shift_desc: ''},
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
        dataField: 'current_shift_desc',
        text: 'Descripción',
      },
      {
        dataField: 'next_shift',
        text: 'Abril 2019',
      },
      {
        dataField: 'next_shift_desc',
        text: 'Descripción',
        style: (cell, row, rowIndex, colIndex) => {
          if (cell === '') {
            return { backgroundColor: '#ff8a80', color: 'white' };
          } else {
            return { backgroundColor: '#81c784', color: 'white' };
          }
        },
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
        <div className="col-md-12 mb-2">
          <div className="card dashboard__table">
            <h5 className="card-title">Mis colaboradores</h5>
            <div className="table-responsive">
              <BootstrapTable
                bootstrap4
                bordered={ false }
                columns={ columns }
                data={ employees }
                keyField='id'
              />
            </div>
          </div>
        </div>
        <ShiftPlan/>
        <AvailableShifts/>
      </React.Fragment>
    );
  }
}

export default StaffingIndex;
