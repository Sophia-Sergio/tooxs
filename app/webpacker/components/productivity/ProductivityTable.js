import React, { Component } from 'react';
import BootstrapTable from 'react-bootstrap-table-next';
import paginationFactory from 'react-bootstrap-table2-paginator';
import { currencyFormat } from "../helpers";
import PropTypes from 'prop-types';

class ProductivityTable extends Component {
  state = {
    prod_real: {
      plan: [86543635, 88784722, 59084909,	0],
      weekly_dotation: [780, 805, 827, 748],
      productivity: [57540, 56104, 55081, 60331]
    },
    prod_optimized: {
      plan: [86543635, 88784722, 59084909,	0],
      weekly_dotation: [513, 534, 537, 525],
      productivity: [87487, 84576, 84827, 85957]
    }
  }

  render () {
    const { prod_real, prod_optimized } = this.state;
    return (
      <React.Fragment>
        <div className="col-md-12 mb-2">
          <div className="card dashboard__table">
            <h5 className="card-title">Productividad Real</h5>
            <div className="table-responsive">
              <table className="table">
                <thead>
                  <tr>
                    <th></th>
                    <th style={{ fontSize: '12px', textAlign: 'center' }}>Semana 1</th>
                    <th style={{ fontSize: '12px', textAlign: 'center' }}>Semana 2</th>
                    <th style={{ fontSize: '12px', textAlign: 'center' }}>Semana 3</th>
                    <th style={{ fontSize: '12px', textAlign: 'center' }}>Semana 4</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td style={{ textAlign: 'center' }} className="shifts" title="Plan de venta">Ventas Reales</td>
                    {prod_real.plan.map( prod => (
                      <td style={{ textAlign: 'center' }}>${ currencyFormat(prod) }</td>
                    ))}
                  </tr>
                  <tr>
                    <td style={{ textAlign: 'center' }} className="shifts" title="Dotación semanal (HH)">Dotación semanal (HH)</td>
                    {prod_real.weekly_dotation.map( dotation => (
                      <td style={{ textAlign: 'center' }}>{ dotation }</td>
                    ))}
                  </tr>
                  <tr>
                    <td style={{ textAlign: 'center' }} className="shifts" title="Productividad">Productividad</td>
                    {prod_real.productivity.map( prod => (
                      <td style={{ textAlign: 'center' }}>${ currencyFormat(prod) }</td>
                    ))}
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div className="col-md-12 mb-2">
          <div className="card dashboard__table">
            <h5 className="card-title">Productividad optimizada</h5>
            <div className="table-responsive">
              <table className="table">
                <thead>
                  <tr>
                    <th></th>
                    <th style={{ fontSize: '12px', textAlign: 'center' }}>Semana 1</th>
                    <th style={{ fontSize: '12px', textAlign: 'center' }}>Semana 2</th>
                    <th style={{ fontSize: '12px', textAlign: 'center' }}>Semana 3</th>
                    <th style={{ fontSize: '12px', textAlign: 'center' }}>Semana 4</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td style={{ textAlign: 'center' }} className="shifts" title="Plan de venta">Ventas Reales</td>
                    {prod_optimized.plan.map( prod => (
                      <td style={{ textAlign: 'center' }}>${ currencyFormat(prod) }</td>
                    ))}
                  </tr>
                  <tr>
                    <td style={{ textAlign: 'center' }} className="shifts" title="Dotación semanal (HH)">Dotación semanal (HH)</td>
                    {prod_optimized.weekly_dotation.map( dotation => (
                      <td style={{ textAlign: 'center' }}>{ dotation }</td>
                    ))}
                  </tr>
                  <tr>
                    <td style={{ textAlign: 'center' }} className="shifts" title="Productividad">Productividad</td>
                    {prod_optimized.productivity.map( prod => (
                      <td style={{ textAlign: 'center' }}>${ currencyFormat(prod) }</td>
                    ))}
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default ProductivityTable;
