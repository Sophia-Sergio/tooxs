import React, { Component } from "react";
import BootstrapTable from 'react-bootstrap-table-next';
import paginationFactory from 'react-bootstrap-table2-paginator';
import styled from 'styled-components';
import PropTypes from 'prop-types';
import userDefault from '../../images/user_default';

class EmployeesTable extends Component {
  render () {
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
        dataField: 'sell',
        text: 'Ventas',
        sort: true
      },
      {
        dataField: 'goal',
        text: 'Meta',
        sort: true
      },
      {
        dataField: 'shifts',
        text: 'Turnos',
      },
    ];
    return (
      <div className="col-md-7">
        <div className="card dashboard__table">
          <div className="table-responsive">
            <BootstrapTable
              bootstrap4
              bordered={ false }
              columns={ columns }
              data={ this.props.employees }
              headerClasses='bg-primary text-white'
              keyField='id'
              pagination={ paginationFactory() }
            />
          </div>
        </div>
      </div>
    );
  }
}

export default EmployeesTable;
