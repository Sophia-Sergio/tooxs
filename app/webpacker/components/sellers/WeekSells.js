import React, { Component } from 'react';

class WeekSells extends Component {
  state = {}
  render () {
    const { month } = this.props;
    return (
      <table className="table mb-4 month-sells">
        <thead>
          <tr>
            <th className="p-0" colspan="9">
              <h3 className="m-0">{month.week_name}</h3>
            </th>
          </tr>
          <tr>
            <th>Ventas</th>
            <th>Lun</th>
            <th>Mar</th>
            <th>Mie</th>
            <th>Jue</th>
            <th>Vie</th>
            <th>Sáb</th>
            <th>Dom</th>
            <th>Total</th>
          </tr>
          <tr>
            <th> - </th>
            {month.week_dates.map( (day, index) => (
              <th key={index}>{day}</th>
            ))}
            <th></th>
          </tr>
        </thead>
        <tbody className="t-p-3">
          <tr>
            <th>Plan</th>
            <td>$0</td>
            <td>$0</td>
            <td>$0</td>
            <td>$0</td>
            <td>$0</td>
            <td>$0</td>
            <td>$0</td>
            <td>$0</td>
          </tr>
          <tr>
            <th>Real</th>
            <td>$0</td>
            <td>$0</td>
            <td>$0</td>
            <td>$0</td>
            <td>$0</td>
            <td>$0</td>
            <td>$0</td>
            <td>$0</td>
          </tr>
        </tbody>
      </table>
    );
  }
}

export default WeekSells;
