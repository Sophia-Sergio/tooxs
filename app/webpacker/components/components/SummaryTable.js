import React from 'react';
import { currencyFormat } from '../lib/helpers';

const summaryTable = props => (
  <div className="col-12" style={{marginBottom: "10px"}}>
    <div className="card dashboard__table">
      <h5 className="card-title">{props.table_title}</h5>
      <div className="table-responsive">
        <table className="table">
          <thead>
            <tr>
              <th />
              {props.row_titles.map((title, index) => (
                <th key={index}>
                  <span className="table-tooltip">
                    {title.label}
                    <div className="table-tooltip__text">{title.tootlip}</div>
                  </span>
                </th>
              ))}
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
            {props.datasets.map((dataset, index) => (
              <tr>
                <td className={'shifts'}>
                  {dataset.label}
                </td>
                {dataset.data.map((e, index) => (
                  <td>
                    {dataset.currency ? '$' : null}{' '}
                    {currencyFormat(parseInt(e))}
                  </td>
                ))}
                <td>
                  {dataset.currency ? '$' : null}{' '}
                  {currencyFormat(dataset.data.reduce( (acum, e) => acum + parseInt(e), 0 ))}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  </div>
);

export default summaryTable;
