import React, { Component } from "react"
import { BootstrapTable, TableHeaderColumn } from 'react-bootstrap-table';
import DefaultAvatar from '../images/user_default.jpg'
import PropTypes from "prop-types"

class SellersTable extends Component {
  state = {
    tableTitle: 'Resultado de búsqueda',
    // Ejemplo de Jso
    employees: [
      {
        rut: '12.222.008-7',
        avatar: '',
        name: 'Ricardo',
        lastname: 'Gonzalez',
        email: 'demo@tooxs.com',
        phone: '+56999999999',
        store: 'Alto Las Condes',
        department: 'Juvenil mujer',
        shift_description: 'Turno 1 de 45 horas',
        details: ''
      }
    ]
  }

  // It's a data format example.
  avatarFormatter(cell, row){
    console.log(DefaultAvatar);
    return (cell && cell != '') ? '<div className="thumbnail"><img src=' + cell + ' /></div>' : '<div className="thumbnail"><img src=' + DefaultAvatar + ' /></div>' }

  render () {
    console.log(this.props.sellers);
    const { tableTitle, employees } = this.state;
    return (
      <div className="table-responsive">
        <BootstrapTable
          data={this.props.sellers}
          pagination
          version='4'
        >
          <TableHeaderColumn isKey dataField='avatar'></TableHeaderColumn>
          <TableHeaderColumn dataField='name' dataSort>Nombre</TableHeaderColumn>
          <TableHeaderColumn dataField='lastname' dataFormat={this.priceFormatter} dataSort>Apellido</TableHeaderColumn>
          <TableHeaderColumn dataField='rut' dataSort>RUT</TableHeaderColumn>
          <TableHeaderColumn dataField='email' dataSort>Email</TableHeaderColumn>
          <TableHeaderColumn dataField='store_id' dataSort>Tienda</TableHeaderColumn>
          <TableHeaderColumn dataField='department_id' dataSort>Departamento</TableHeaderColumn>
          <TableHeaderColumn dataField='assigned_shift' dataSort>Turno</TableHeaderColumn>
          <TableHeaderColumn dataField='datails'>Más info</TableHeaderColumn>
        </BootstrapTable>
      </div>
    );
  }
}

export default SellersTable