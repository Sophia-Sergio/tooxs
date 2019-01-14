import React, { Component } from 'react';
import BootstrapTable from 'react-bootstrap-table-next';
import paginationFactory from 'react-bootstrap-table2-paginator';
import { currencyFormat } from "./helpers";
import PropTypes from 'prop-types';

class SalePlans extends Component {
  state = {
    shifts: [
      {
        id: 1,
        shift_name: 'Turno 1 de 45 horas',
      },
      {
        id: 2,
        shift_name: 'Turno 2 de 45 horas'
      },
      {
        id: 3,
        shift_name: 'Turno 3 de 45 horas'
      },
      {
        id: 4,
        shift_name: 'Turno 4 de 45 horas'
      },
      {
        id: 5,
        shift_name: 'Turno 1 de 36 horas'
      },
      {
        id: 6,
        shift_name: 'Turno 2 de 36 horas'
      },
      {
        id: 7,
        shift_name: 'Turno 3 de 36 horas'
      },
      {
        id: 8,
        shift_name: 'Turno 4 de 36 horas'
      },
      {
        id: 9,
        shift_name: 'Turno 1 de 24 horas'
      },
      {
        id: 10,
        shift_name: 'Turno Sábado - Domingo'
      },
      {
        id: 11,
        shift_name: 'Turno 1 tarde'
      },
      {
        id: 8,
        shift_name: 'Turno 2 tarde'
      },
    ]
  }

  render () {
    const { shifts } = this.state;
    const columns = [
      {
        dataField: 'id',
        text: 'ID',
        sort: true
      },
      {
        dataField: 'shift_name',
        text: 'Nombre',
        sort: true
      },
      {
        dataField: 'id',
        text: 'Acciones',
        formatter: (cellContent) => (
          <React.Fragment>
            <a className="btn btn-outline-secondary btn-sm" href={'/available_shifts/' + cellContent} style={{fontSize: '10px'}}>
              <i class="fa fa-eye"></i>
            </a>
          </React.Fragment>
        ),
      },
    ];
    return (
      <div className="col-md-12">
        <div className="card dashboard__table">
          <h5 className="card-title">Listado de turnos disponibles</h5>
          <div className="table-responsive">
            <BootstrapTable
              bootstrap4
              bordered={ false }
              columns={ columns }
              data={ shifts }
              keyField='id'
              pagination={ paginationFactory() }
            />
          </div>
        </div>
      </div>
    );
  }
}

export default SalePlans;
