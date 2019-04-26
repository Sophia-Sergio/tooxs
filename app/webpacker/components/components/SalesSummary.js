import React, { Component } from 'react';
import axios from 'axios';
import { currencyFormat } from '../lib/helpers';

export default class SalesSummary extends Component {
  state = {
    plan: {},
    historic: {},
    real: {},
    real_vs_plan: [],
    real_vs_historic: [],
    store_1: {},
    store_2: {},
    store_1_vs_store_2: []
  };

  getPercentageDifference = (val, index) => {
    let percentage = (
      ((this.props.datasets[0].data[index] - parseInt(val)) / parseInt(val)) *
      100
    ).toFixed(2);
    if (isNaN(percentage) || !isFinite(percentage)) {
      percentage = 0;
    }
    return percentage;
  };

  render() {
    const { isCompared, title, datasets, compared_datasets } = this.props;
    return (
      <div className="col-12">
        <div className="card dashboard__table">
          <h5 className="card-title">Tabla comparativa de ventas</h5>
          <div className="table-responsive">
            <table className="table">
              <thead>
                <tr>
                  <th />
                  {title.map((title, index) => (
                    <th key={index}>
                      <span className="table-tooltip">
                        {title.label}
                        <div className="table-tooltip__text">
                          {title.tootlip}
                        </div>
                      </span>
                    </th>
                  ))}
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                {datasets.map((dataset, index) => (
                  <tr>
                    <td
                      className={
                        isCompared && index === 0
                          ? 'bg-primary text-white'
                          : 'shifts'
                      }
                      style={{ whiteSpace: 'nowrap' }}
                    >
                      {dataset.label}
                    </td>
                    {dataset.data.map((item, i) => (
                      <td className={isCompared && index === 0 && 'shifts'}>
                        ${currencyFormat(parseInt(item))}
                        {index != 0 && this.props.isCompared && (
                          <span
                            className={
                              'difference ' +
                              (this.getPercentageDifference(item, i) >= 0
                                ? 'positive'
                                : 'negative')
                            }
                          >
                            {this.getPercentageDifference(item, i)}%
                          </span>
                        )}
                      </td>
                    ))}
                    <td className={isCompared && index === 0 && 'shifts'}>
                      $
                      {currencyFormat(
                        dataset.data.reduce(
                          (total, num) => total + parseInt(num),
                          0
                        )
                      )}
                    </td>
                  </tr>
                ))}
              </tbody>
              {!this.props.isCompared && (
                <tfoot>
                  <tr>
                    <td
                      className="bg-dark text-white"
                      style={{ whiteSpace: 'nowrap' }}
                    >
                      Real vs Plan
                    </td>
                    {compared_datasets[0].data.map(item => (
                      <td className="bg-secondary text-white">{item}%</td>
                    ))}
                    <td className="bg-dark text-white">
                      {(
                        compared_datasets[0].data.reduce(
                          (total, num) => total + parseInt(num),
                          0
                        ) / compared_datasets[0].data.length
                      ).toFixed(2)}
                      %
                    </td>
                  </tr>
                  <tr>
                    <td
                      className="bg-dark text-white"
                      style={{ whiteSpace: 'nowrap' }}
                    >
                      Real vs Histórico
                    </td>
                    {compared_datasets[1].data.map(item => (
                      <td className="bg-secondary text-white">{item}%</td>
                    ))}
                    <td className="bg-dark text-white">
                      {(
                        compared_datasets[1].data.reduce(
                          (total, num) => total + parseInt(num),
                          0
                        ) / compared_datasets[1].data.length
                      ).toFixed(2)}
                      %
                    </td>
                  </tr>
                </tfoot>
              )}
            </table>
          </div>
        </div>
      </div>
    );
  }
}
