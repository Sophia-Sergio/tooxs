import React, { Component } from 'react';
import { currencyFormat } from '../../lib/helpers';

class DetailTable extends Component {
  state = {
    savings: [872,	2616000],
    sell: [82,	6970000],
  }
  render () {
    const { savings, sell } = this.state;
    return (
      <div className="col-12">
        <div className="card dashboard__table">
          <h5 className="card-title">Detalle</h5>
          <div className="table-responsive">
            <table className="table">
              <thead>
                <tr>
                  <th>Item</th>
                  <th style={{textAlign: 'center'}}>Total</th>
                  <th style={{textAlign: 'center'}}>En pesos</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td className="shifts">Ahorro en costo</td>
                  <td style={{textAlign: 'center'}}>{ savings[0] }</td>
                  <td style={{textAlign: 'center'}}>{ currencyFormat(savings[1]) }</td>
                </tr>
                <tr>
                  <td className="shifts">Venta recuperada</td>
                  <td style={{textAlign: 'center'}}>${ sell[0] }</td>
                  <td style={{textAlign: 'center'}}>${ currencyFormat(sell[1]) }</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    );
  }
}

export default DetailTable;
