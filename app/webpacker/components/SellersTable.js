import React, { Component } from "react";
import BootstrapTable from 'react-bootstrap-table-next';
import paginationFactory from 'react-bootstrap-table2-paginator';
import DefaultAvatar from '../images/user_default.jpg';
import styled from 'styled-components';
import PropTypes from 'prop-types';

class SellersTable extends Component {

  render () {
    const Avatar = styled.div`
      border-radius: 50%;
      height: 30px;
      overflow: hidden;
      width: 30px;
    `
    ;
    const AvatarImg = styled.img`
      display: block;
      width: 100%;
    `
    ;
    const sellers = [
      {
        id: 1,
        rut: '12.222.008-7',
        name: 'Ricardo',
        lastname: 'Gonzalez'
      },
      {
        id: 2,
        rut: '14.222.008-7',
        name: 'Richard',
        lastname: 'Gonzalez'
      },
    ]

    const avatarFormatter = function(cell, row){
      return <Avatar><AvatarImg src={ cell ? cell : DefaultAvatar }/></Avatar>;
    };

    const linkFormatter = function(cell, row){
      return <a href={'/sellers/' + cell}>Detalle</a>;
    };

    const columns = [
      {
        dataField: 'avatar',
        text: '',
        formatter: avatarFormatter
      },
      {
        dataField: 'name',
        text: 'Nombre',
        sort: true
      },
      {
        dataField: 'lastname',
        text: 'Apellido',
        sort: true
      },
      {
        dataField: 'rut',
        text: 'RUT'
      },
      {
        dataField: 'department_id',
        text: 'Tienda'
      },
      {
        dataField: 'assigned_shift',
        text: 'Turno'
      },
      {
        dataField: 'id',
        text: 'Detalle',
        formatter: linkFormatter
      },
    ];
    return (
      <div className="table-responsive">
        <BootstrapTable bootstrap4 keyField='id' data={ this.props.sellers } columns={ columns } pagination={ paginationFactory() } />
      </div>
    );
  }
}

export default SellersTable