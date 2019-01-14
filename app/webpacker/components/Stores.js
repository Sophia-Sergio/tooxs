import React, { Component } from 'react';
import BootstrapTable from 'react-bootstrap-table-next';
import paginationFactory from 'react-bootstrap-table2-paginator';
import { currencyFormat } from "./helpers";
import PropTypes from 'prop-types';

class SalePlans extends Component {
  state = {
    stores: [
      {
        id: 1,
        name: 'Alto las Condes',
        address: 'Av. Pdte. Kennedy',
        address_number: '9001',
        city: 'Santiago',
        commune: 'Las Condes',
        state: 'RM',
        country: 'Chile',
        country_code: 'CL',
        store_size: 'Grande',
        economic_segment: 'ABC1'
      },
      {
        id: 2,
        name: 'Parque Arauco',
        address: 'Av. Pdte. Kennedy',
        address_number: '5413',
        city: 'Santiago',
        commune: 'Las Condes',
        state: 'RM',
        country: 'Chile',
        country_code: 'CL',
        store_size: 'Grande',
        economic_segment: 'ABC1'
      },
      {
        id: 3,
        name: 'Santiago Centro',
        address: 'Ahumada',
        address_number: '112',
        city: 'Santiago',
        commune: 'Santiago',
        state: 'RM',
        country: 'Chile',
        country_code: 'CL',
        store_size: 'Grande',
        economic_segment: 'C3'
      },
      {
        id: 4,
        name: 'Plaza Oeste',
        address: 'Av. Américo Vespucio',
        address_number: '1501',
        city: 'Santiago',
        commune: 'Cerrillos',
        state: 'RM',
        country: 'Chile',
        country_code: 'CL',
        store_size: 'Grande',
        economic_segment: 'C3'
      },
      {
        id: 5,
        name: 'Plaza Egaña',
        address: 'Av. Larraín',
        address_number: '5',
        city: 'Santiago',
        commune: 'La Reina',
        state: 'RM',
        country: 'Chile',
        country_code: 'CL',
        store_size: 'Grande',
        economic_segment: 'C2'
      },
      {
        id: 6,
        name: 'Portal La Dehesa',
        address: 'Av. La Dehesa',
        address_number: '1445',
        city: 'Santiago',
        commune: 'Lo Barnechea',
        state: 'RM',
        country: 'Chile',
        country_code: 'CL',
        store_size: 'Grande',
        economic_segment: 'C2'
      },
    ]
  }

  render () {
    const { stores } = this.state;
    const columns = [
      {
        dataField: 'id',
        text: 'ID Origen',
        sort: true
      },
      {
        dataField: 'name',
        text: 'Nombre',
        sort: true
      },
      {
        dataField: 'address',
        text: 'Dirección',
      },
      {
        dataField: 'address_number',
        text: 'Número',
      },
      {
        dataField: 'city',
        text: 'Ciudad',
        sort: true,
      },
      {
        dataField: 'commune',
        text: 'Comuna',
        sort: true,
      },
      {
        dataField: 'state',
        text: 'Distrito / Provincia',
        sort: true,
      },
      {
        dataField: 'country_code',
        text: 'Código País',
        sort: true,
      },
      {
        dataField: 'store_size',
        text: 'Tamaño',
        sort: true,
      },
      {
        dataField: 'economic_segment',
        text: 'Segmento Económico',
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
          <h5 className="card-title">Listado de usuarios</h5>
          <div className="table-responsive">
            <BootstrapTable
              bootstrap4
              bordered={ false }
              columns={ columns }
              data={ stores }
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
