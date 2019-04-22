import React, { Component } from 'react';
import { currencyFormat } from '../../lib/helpers';

class ProductivityTable extends Component {
  state = {
    real_productivity: [3160, 172803395, 54684,	92,	1217],
    optimized_productivity: [2109, 172803395, 81936, 10, 345],
  }
  render () {
    const { real_productivity, optimized_productivity } = this.state;
    return (
      <div className="col-12 mb-2">
        <div className="card dashboard__table">
          <h5 className="card-title">Productividad</h5>
          <div className="table-responsive">
            <table className="table">
              <thead>
                <tr>
                  <th></th>
                  <th style={{textAlign: 'center'}}>HH</th>
                  <th style={{textAlign: 'center'}}>Venta</th>
                  <th style={{textAlign: 'center'}}>Productividad</th>
                  <th style={{textAlign: 'center'}}>Horas faltantes</th>
                  <th style={{textAlign: 'center'}}>Horas exeso</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td className="shifts">Producción real</td>
                  <td style={{textAlign: 'center'}}>{ real_productivity[0] }</td>
                  <td style={{textAlign: 'center'}}>${ currencyFormat(real_productivity[1]) }</td>
                  <td style={{textAlign: 'center'}}>${ currencyFormat(real_productivity[2]) }</td>
                  <td style={{textAlign: 'center'}}>{ real_productivity[3] }</td>
                  <td style={{textAlign: 'center'}}>{ real_productivity[4] }</td>
                </tr>
                <tr>
                  <td className="shifts">Producción optimizada</td>
                  <td style={{textAlign: 'center'}}>{ optimized_productivity[0] }</td>
                  <td style={{textAlign: 'center'}}>${ currencyFormat(optimized_productivity[1]) }</td>
                  <td style={{textAlign: 'center'}}>${ currencyFormat(optimized_productivity[2]) }</td>
                  <td style={{textAlign: 'center'}}>{ optimized_productivity[3] }</td>
                  <td style={{textAlign: 'center'}}>{ optimized_productivity[4] }</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    );
  }
}

export default ProductivityTable;
