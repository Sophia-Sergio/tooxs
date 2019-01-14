import React, { Component } from 'react';
import BootstrapTable from 'react-bootstrap-table-next';
import paginationFactory from 'react-bootstrap-table2-paginator';
import PropTypes from 'prop-types';

class StaffingReals extends Component {
  state = {
    staffing: [
      {
        store_id: 13,
        store_name: 'Alto las Condes',
        department_id: 1,
        department_name: 'Moda Mujer',
        year: 2018,
        month: 1,
        day: 1,
        hour: 1,
        count: 78,
      },
      {
        store_id: 13,
        store_name: 'Alto las Condes',
        department_id: 1,
        department_name: 'Rincón Juvenil Hombre',
        year: 2018,
        month: 1,
        day: 2,
        hour: 1,
        count: 78,
      },
      {
        store_id: 13,
        store_name: 'Alto las Condes',
        department_id: 1,
        department_name: 'Rincón Juvenil Hombre',
        year: 2018,
        month: 1,
        day: 3,
        hour: 1,
        count: 78,
      },
      {
        store_id: 13,
        store_name: 'Alto las Condes',
        department_id: 1,
        department_name: 'Rincón Juvenil Hombre',
        year: 2018,
        month: 1,
        day: 4,
        hour: 1,
        count: 78,
      },
    ]
  }

  render () {
    const { staffing } = this.state;
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
        dataField: 'year',
        text: 'Año',
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
        dataField: 'count',
        text: 'Cantidad',
      },
    ];
    return (
      <div className="col-md-12">
        <div className="card dashboard__table">
          <h5 className="card-title">Turnos reales por día</h5>
          <div className="table-responsive">
            <BootstrapTable
              bootstrap4
              bordered={ false }
              columns={ columns }
              data={ staffing }
              keyField='id'
              pagination={ paginationFactory() }
            />
          </div>
        </div>
      </div>
    );
  }
}

export default StaffingReals
