import React, { Component } from 'react';
import { currencyFormat } from '../helpers';

class ProductivityTable extends Component {
  state = {
    real_productivity: {
      real_sells: [86543635, 88784722, 59084909,	0],
      weekly_hours: [780, 805, 827, 748],
      productivity: [57540,	56104, 55081, 60331],
    },
    optimized_productivity: {
      real_sells: 	[86543635, 88784722, 59084909,	0],
      weekly_hours: [513, 534, 537, 525],
      productivity: [87487,	84576,	84827, 85957],
    },
  }
  render () {
    const { real_productivity, optimized_productivity } = this.state;
    return (
      <div className="col-12 mb-2">
        <div className="card dashboard__table">
          <h5 className="card-title">Productividad optimizada</h5>
          <div className="table-responsive mb-2">
            <table className="table">
              <thead>
                <tr>
                  <th></th>
                  <th style={{textAlign: 'center'}}>Semana 1</th>
                  <th style={{textAlign: 'center'}}>Semana 2</th>
                  <th style={{textAlign: 'center'}}>Semana 3</th>
                  <th style={{textAlign: 'center'}}>Semana 4</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td className="shifts">Plan de venta</td>
                  { real_productivity.real_sells.map( sell => (
                    <td style={{textAlign: 'center'}}>${ currencyFormat(sell) }</td>
                  ))}
                </tr>
                <tr>
                  <td className="shifts">Dotación semanal (HH)</td>
                  { real_productivity.weekly_hours.map( hours => (
                    <td style={{textAlign: 'center'}}>{ hours }</td>
                  ))}
                </tr>
                <tr>
                  <td className="shifts">Productividad</td>
                  { real_productivity.productivity.map( sell => (
                    <td style={{textAlign: 'center'}}>${ currencyFormat(sell) }</td>
                  ))}
                </tr>
              </tbody>
            </table>
          </div>
          <h5 className="card-title">Productividad real</h5>
          <div className="table-responsive mb-2">
            <table className="table">
              <thead>
                <tr>
                  <th></th>
                  <th style={{textAlign: 'center'}}>Semana 1</th>
                  <th style={{textAlign: 'center'}}>Semana 2</th>
                  <th style={{textAlign: 'center'}}>Semana 3</th>
                  <th style={{textAlign: 'center'}}>Semana 4</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td className="shifts">Plan de venta</td>
                  { optimized_productivity.real_sells.map( sell => (
                    <td style={{textAlign: 'center'}}>${ currencyFormat(sell) }</td>
                  ))}
                </tr>
                <tr>
                  <td className="shifts">Dotación semanal (HH)</td>
                  { optimized_productivity.weekly_hours.map( hours => (
                    <td style={{textAlign: 'center'}}>{ hours }</td>
                  ))}
                </tr>
                <tr>
                  <td className="shifts">Productividad</td>
                  { optimized_productivity.productivity.map( sell => (
                    <td style={{textAlign: 'center'}}>${ currencyFormat(sell) }</td>
                  ))}
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
