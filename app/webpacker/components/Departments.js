import React, { Component } from 'react';
import BootstrapTable from 'react-bootstrap-table-next';
import paginationFactory from 'react-bootstrap-table2-paginator';
import { currencyFormat } from "./helpers";
import PropTypes from 'prop-types';

class SalePlans extends Component {
  state = {
    departments: [
      {
        id: 1,
        department: 'Juvenil Mujer',
        store: 'Alto Las Condes',
      },
      {
        id: 2,
        department: 'Moda Hombre',
        store: 'Alto Las Condes',
      },
      {
        id: 3,
        department: 'Tecnología',
        store: 'Alto Las Condes',
      },
      {
        id: 4,
        department: 'Deportes',
        store: 'Alto Las Condes',
      },
      {
        id: 5,
        department: 'Moda Mujer',
        store: 'Alto Las Condes',
      },
      {
        id: 6,
        department: 'Infantil',
        store: 'Alto Las Condes',
      },
    ]
  }

  render () {
    const { departments } = this.state;
    const columns = [
      {
        dataField: 'id',
        text: 'ID Departamento',
        sort: true
      },
      {
        dataField: 'department',
        text: 'Nombre',
        sort: true
      },
      {
        dataField: 'store',
        text: 'Tienda',
        sort: true,
      },
      {
        dataField: 'id',
        text: 'Acciones',
        formatter: (cellContent) => (
          <React.Fragment>
            <a className="btn btn-outline-secondary btn-sm" href={'/stores/' + cellContent} style={{fontSize: '10px'}}>
              <i class="fa fa-eye"></i>
            </a>
            <a className="btn btn-outline-info btn-sm ml-1" href={'/stores/' + cellContent + 'edit'} style={{fontSize: '10px'}}>
              <i class="fa fa-pencil"></i>
            </a>
            <a
              className="btn btn-outline-danger btn-sm ml-1"
              data-confirm="¿Estás seguro que quieres eliminar este usuario?"
              data-method="DELETE"
              href={'/stores/' + cellContent}
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
          <h5 className="card-title">Listado de departmentos habilitados</h5>
          <div className="table-responsive">
            <BootstrapTable
              bootstrap4
              bordered={ false }
              columns={ columns }
              data={ departments }
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
