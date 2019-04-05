import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat } from '../helpers';
import Loader from '../components/UI/Loader';
import Select from 'react-select';
import BootstrapTable from 'react-bootstrap-table-next';
import paginationFactory from 'react-bootstrap-table2-paginator';

export default class StaffRequested extends Component {
  state = {
    loading: false,
    result: '',
    store: {label: 'Alto Las Condes', value: '12'},
    storeOptions: [{label: 'Alto Las Condes', value: '12'}],
    department: {label: 'Juvenil Mujer', value: '12'},
    departmentOptions: [
      {label: 'Alto Las Condes', value: '12'},
      {label: 'Moda Hombre', value: '11'},
      {label: 'Tecnología', value: '10'}
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
    shifts: [
      {store: 'Alto Las Condes', department: 'Juvenil Mujer', shift: '1', shift_description: 'Turno 1', available_shifts: '1', required_shifts: '0', initial_date: '01-06-2018'},
      {store: 'Alto Las Condes', department: 'Juvenil Mujer', shift: '2', shift_description: 'Turno 1', available_shifts: '1', required_shifts: '0', initial_date: '01-06-2018'},
      {store: 'Alto Las Condes', department: 'Juvenil Mujer', shift: '3', shift_description: 'Turno 1', available_shifts: '5', required_shifts: '0', initial_date: '01-06-2018'},
      {store: 'Alto Las Condes', department: 'Juvenil Mujer', shift: '4', shift_description: 'Turno 1', available_shifts: '3', required_shifts: '0', initial_date: '01-06-2018'},
      {store: 'Alto Las Condes', department: 'Juvenil Mujer', shift: '5', shift_description: 'Turno 1', available_shifts: '1', required_shifts: '0', initial_date: '01-06-2018'},
    ]
  }

  render() {
    const { store, storesOptions, department, departmentOptions, year, yearOptions, month, monthOptions, shifts } = this.state;
    const columns = [
      {
        dataField: 'store',
        text: 'Tienda',
        sort: true
      },
      {
        dataField: 'department',
        text: 'Departamento',
        sort: true
      },
      {
        dataField: 'shift',
        text: 'Turno',
        sort: true
      },
      {
        dataField: 'shift_description',
        text: 'Descripción del turno'
      },
      {
        dataField: 'available_shifts',
        text: 'Cantidad necesaria'
      },
      {
        dataField: 'required_shifts',
        text: 'Cantidad a solicitar',
        formatter: (cellContent, row) => (
          <div className="form-group" style={{margin: 0}}>
            <input type="number" class="form-control" id={ 'shift-' + row.shift } />
          </div>
        ),
      },
      {
        dataField: 'initial_date',
        text: 'Fecha inicial',
      },
    ];

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
                  isMulti
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
        <div class="col-12">
          <div class="card dashboard__table">
            <h5 class="card-title">Resultado de búsqueda</h5>
            <div class="table-responsive">
              <BootstrapTable
                bootstrap4
                bordered={ false }
                columns={ columns }
                data={ shifts }
                keyField='id'
                pagination={ paginationFactory() }
              />
              <div className="d-flex justify-content-end mb-2">
                <button name="button" type="submit" className="btn btn-success">Resumir</button>
              </div>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}