import React, { Component } from 'react';
import BootstrapTable from 'react-bootstrap-table-next';
import paginationFactory from 'react-bootstrap-table2-paginator';
import { currencyFormat } from "./helpers";
import PropTypes from 'prop-types';

class SalePlans extends Component {
  state = {
    sales: [
      {
        store_id: 13,
        store_name: 'Alto las Condes',
        department_id: 1,
        department_name: 'Moda Mujer',
        date: '01/01/2018',
        week: 1,
        month: 1,
        day: 'Lunes',
        total: 5789694,
      },
      {
        store_id: 13,
        store_name: 'Alto las Condes',
        department_id: 1,
        department_name: 'Rincón Juvenil Hombre',
        date: '01/01/2018',
        week: 1,
        month: 1,
        day: 'Lunes',
        total: 5789694,
      },
      {
        store_id: 13,
        store_name: 'Alto las Condes',
        department_id: 1,
        department_name: 'Rincón Juvenil Hombre',
        date: '01/01/2018',
        week: 1,
        month: 1,
        day: 'Lunes',
        total: 5789694,
      },
      {
        store_id: 13,
        store_name: 'Alto las Condes',
        department_id: 1,
        department_name: 'Rincón Juvenil Hombre',
        date: '01/01/2018',
        week: 1,
        month: 1,
        day: 'Lunes',
        total: 5789694,
      },
    ]
  }

  render () {
    const { sales } = this.state;
    const columns = [
      {
        dataField: 'store_name',
        text: 'Tienda',
        sort: true
      },
      {
        dataField: 'department_name',
        text: 'Departamento',
        sort: true
      },
      {
        dataField: 'date',
        text: 'Fecha',
        sort: true,
      },
      {
        dataField: 'week',
        text: 'Semana',
        sort: true,
      },
      {
        dataField: 'month',
        text: 'Mes',
        sort: true,
      },
      {
        dataField: 'day',
        text: 'Día',
      },
      {
        dataField: 'hour',
        text: 'Hora',
      },
      {
        dataField: 'total',
        text: 'Cantidad',
        formatter: (cellContent) => (
          '$' + currencyFormat(cellContent)
        ),
      },
    ];
    return (
      <div className="col-md-12">
        <div className="card dashboard__table">
          <h5 className="card-title">Plan de ventas por tienda y departamento</h5>
          <div className="table-responsive">
            <BootstrapTable
              bootstrap4
              bordered={ false }
              columns={ columns }
              data={ sales }
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
