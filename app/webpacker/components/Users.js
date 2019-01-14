import React, { Component } from 'react';
import BootstrapTable from 'react-bootstrap-table-next';
import paginationFactory from 'react-bootstrap-table2-paginator';
import { currencyFormat } from "./helpers";
import PropTypes from 'prop-types';

class SalePlans extends Component {
  state = {
    users: [
      {
        id: 1,
        name: 'Ricardo',
        last_name: 'Gonzalez',
        rol: 'Colaborador',
        status: 'Activo',
        rut: '12.222.008-7',
      },
      {
        id: 2,
        name: 'Claudia Andrea',
        last_name: 'Bravo Lopez',
        rol: 'Colaborador',
        status: 'Activo',
        rut: '12.222.008-7',
      },
      {
        id: 3,
        name: 'Juan',
        last_name: 'Herrera',
        rol: 'Colaborador',
        status: 'Activo',
        rut: '12.222.008-7',
      },
      {
        id: 4,
        name: 'Ulises',
        last_name: 'Medina',
        rol: 'Colaborador',
        status: 'Activo',
        rut: '12.222.008-7',
      },
      {
        id: 5,
        name: 'Rodrigo',
        last_name: 'Sanz',
        rol: 'Colaborador',
        status: 'Activo',
        rut: '13.619.919-6',
      },
    ]
  }

  render () {
    const { users } = this.state;
    const columns = [
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
        dataField: 'rol',
        text: 'Rol',
        sort: true,
      },
      {
        dataField: 'status',
        text: 'Estado',
        sort: true,
      },
      {
        dataField: 'rut',
        text: 'RUT',
        sort: true,
      },
      {
        dataField: 'id',
        text: 'Acciones',
        formatter: (cellContent) => (
          <React.Fragment>
            <a className="btn btn-outline-secondary btn-sm" href={'/users/' + cellContent} style={{fontSize: '10px'}}>
              <i class="fa fa-eye"></i>
            </a>
            <a className="btn btn-outline-info btn-sm ml-1" href={'/users/' + cellContent + 'edit'} style={{fontSize: '10px'}}>
              <i class="fa fa-pencil"></i>
            </a>
            <a
              className="btn btn-outline-danger btn-sm ml-1"
              data-confirm="¿Estás seguro que quieres eliminar este usuario?"
              data-method="DELETE"
              href={'/users/' + cellContent}
              alt="Eliminar usuario"
              style={{fontSize: '10px'}}
            >
              <i class="fa fa-times"></i>
            </a>
          </React.Fragment>
        ),
      },
    ];
    return (
      <div className="col-md-12">
        <div className="card dashboard__table">
          <h5 className="card-title">Listado de usuarios</h5>
          <div className="table-responsive">
            <BootstrapTable
              bootstrap4
              bordered={ false }
              columns={ columns }
              data={ users }
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
