import React, { Component } from "react";
import BootstrapTable from 'react-bootstrap-table-next';
import paginationFactory from 'react-bootstrap-table2-paginator';
import styled from 'styled-components';
import { currencyFormat } from "../helpers";
import userDefault from '../../images/user_default';

class EmployeesTable extends Component {
  render () {
    const sellers_columns = [
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
        dataField: 'surname_1',
        text: 'Apellido',
        sort: true
      },
      {
        dataField: 'sell',
        text: 'Ventas',
        sort: true,
        formatter: (cellContent) => (
          '$' + currencyFormat(cellContent)
        ),
      },
      {
        dataField: 'goal',
        text: 'Meta',
        sort: true,
        formatter: (cellContent) => (
          '$' + currencyFormat(cellContent)
        ),
      },
      {
        dataField: 'shifts',
        text: 'Turnos',
      },
      {
        dataField: 'objective',
        text: 'Cumplimiento',
        formatter: (cellContent, row) => (
          <div className="progress">
            <span className="progress-value">{(cellContent * 100).toFixed(0) + '%'}</span>
            <div className="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style={{width: cellContent * 100 + '%'}}>
            </div>
          </div>
        ),
        headerStyle: {
          width: '120px'
        },
        style: {
          position: 'relative'
        }
      },
    ];
    const assistants_columns = [
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
        dataField: 'surname_1',
        text: 'Apellido',
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
          <h5 className="card-title">Mis colaboradores</h5>
          <ul className="nav nav-tabs" id="myTab" role="tablist">
            { this.props.sellers.length > 0 && 
              <li className="nav-item">
                <a className="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Vendedores</a>
              </li>
            }
            { this.props.sales_assistants.length > 0 && 
              <li className="nav-item">
                <a className="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Asistentes de tienda</a>
              </li>
            }
          </ul>
          <div className="tab-content" id="myTabContent">
          { this.props.sellers.length > 0 && 
            <div className="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
              <div className="table-responsive">
                <BootstrapTable
                  bootstrap4
                  bordered={ false }
                  columns={ sellers_columns }
                  data={ this.props.sellers }
                  keyField='id'
                  pagination={ paginationFactory() }
                />
              </div>
            </div>
          }
          { this.props.sales_assistants.length > 0 && 
            <div className="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
              <div className="table-responsive">
                <BootstrapTable
                  bootstrap4
                  bordered={ false }
                  columns={ assistants_columns }
                  data={ this.props.sales_assistants }
                  keyField='id'
                  pagination={ paginationFactory() }
                />
              </div>
            </div>
          }
          </div>
        </div>
      </div>
    );
  }
}

export default EmployeesTable;
