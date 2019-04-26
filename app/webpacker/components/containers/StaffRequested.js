import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat } from '../lib/helpers';
import Loader from '../components/UI/Loader';
import Select from 'react-select';
import BootstrapTable from 'react-bootstrap-table-next';
import paginationFactory from 'react-bootstrap-table2-paginator';

export default class StaffRequested extends Component {

  state = {
    loading: false,
    result: '',
  }

  render() {
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
        <div class="col-12">
          <div class="card dashboard__table">
            <h5 class="card-title">Detalle de solicitud</h5>
            <div class="table-responsive">
              <table>
                <thead>
                  <tr>
                    <th>Solicitud</th>
                    <th>Tienda</th>
                    <th>Departamento</th>
                    <th>Turno</th>
                    <th>Cantidad</th>
                    <th>Recursos Humanos</th>
                    <th>Interno</th>
                    <th>Laborum</th>
                    <th>Trabajando</th>
                    <th>Fecha solicitud</th>
                    <th colspan="1"></th>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}
