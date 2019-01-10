import React, { Component } from "react";
import BootstrapTable from 'react-bootstrap-table-next';
import paginationFactory from 'react-bootstrap-table2-paginator';
import styled from 'styled-components';
import PropTypes from 'prop-types';

class ComparativeTable extends Component {
  render () {

    this.state = {
      stores: [
        {store: 'Alto Las Condes', week_1: '$42.532.992', week_2: '$42.899.028', week_3: '$43.361.349', week_4: '$44.010.026'},
        {store: 'Parque Arauco', week_1: '$72.335.176', week_2: '$73.323.273', week_3: '$43.361.349', week_4: '$44.010.026'}
      ]
    }

    const columns = [
      {
        dataField: 'store',
        text: 'Tienda',
        sort: true
      },
      {
        dataField: 'week_1',
        text: 'Semana 1',
      },
      {
        dataField: 'week_2',
        text: 'Semana 2'
      },
      {
        dataField: 'week_3',
        text: 'Semana 3'
      },
      {
        dataField: 'week_4',
        text: 'Semana 4'
      }
    ];
    return (
      <div className="table-responsive">
        <BootstrapTable bootstrap4 keyField='id' data={ this.state.stores } columns={ columns } />
      </div>
    );
  }
}

export default ComparativeTable;
