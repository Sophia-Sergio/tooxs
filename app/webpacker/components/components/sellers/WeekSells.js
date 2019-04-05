import React, { Component } from 'react';
import { currencyFormat } from "../../helpers";

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
            <th> Día </th>
            {month.week_dates.map( (day, index) => (
              <th key={index}>{day}</th>
            ))}
            <th></th>
          </tr>
        </thead>
        <tbody className="t-p-3">
          <tr>
            <th>Plan</th>
            {month.week_plan.map( (value, index) => (
              <td key={index}>${currencyFormat(value)}</td>
            ))}
          </tr>
          <tr>
            <th>Real</th>
            {month.week_real.map( (value, index) => (
              <td key={index}>${currencyFormat(value)}</td>
            ))}
          </tr>
        </tbody>
      </table>
    );
  }
}

export default WeekSells;
