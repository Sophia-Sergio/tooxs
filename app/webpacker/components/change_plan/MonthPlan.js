import React, { Component } from "react";
import PropTypes from "prop-types";
import { currencyFormat } from "../helpers";

class MonthPlan extends Component {
  render () {
    const { monthIndex, monthname, weeks, total } = this.props;
    return (
      <div className="card mb-4" style={{padding: '15px'}}>
        <h3 className="change-plans__cont__title" style={{fontSize: '18px'}}>
          {monthname} <span style={{color: '#6c757d', fontWeight: 400}}>de 2018</span>
        </h3>
        <form className="change-plans__form">
          <div className="table-responsive">
            <table className="table mb-2">
              <thead className="thead bg-primary text-white">
                <tr>
                  <th></th>
                  {weeks.map((item, index) => (
                    <th key={index}>{item.name}</th>
                  ))}
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Plan</td>
                  {weeks.map((item, index) => (
                    <td key={index} id={'week-' + item.id} key={item.id}>${currencyFormat(item.plan)}</td>
                  ))}
                  <td>
                    ${currencyFormat( weeks.reduce((prev, cur) => { return prev + cur.plan;}, 0) )}
                  </td>
                </tr>
                <tr>
                  <td>Ajuste en %</td>
                  {weeks.map((item, index) => (
                    <td key={index}>
                      <div className="input-group input-group-sm">
                        <input
                          className="form-control"
                          data-target={'#week-' + item.id}
                          name={'percentage'}
                          onChange={this.props.changePercetage(monthIndex, index)}
                          type="number"
                          max="200"
                          value={item.percentage}
                        />
                        <div className="input-group-append">
                          <span className="input-group-text">%</span>
                        </div>
                      </div>
                    </td>
                  ))}
                  <td></td>
                </tr>
                <tr>
                  <td>Ajuste monto</td>
                  {weeks.map((item, index) => (
                    <td key={index}>
                      <div className="input-group input-group-sm">
                        <div className="input-group-prepend">
                          <span className="input-group-text">$</span>
                        </div>
                        <input className="form-control form-control-sm" data-target={'#week-' + item.id} name={'percentage-' + item.id} type="number" max="200" />
                      </div>
                    </td>
                  ))}
                  <td></td>
                </tr>
              </tbody>
              <tfoot className="thead">
                <tr>
                  <th>Plan ajustado</th>
                  {weeks.map((item, index) => (
                    <th key={index}>
                      ${currencyFormat(item.adjusted)}
                    </th>
                  ))}
                  <th>
                    ${currencyFormat(total)}
                  </th>
                </tr>
              </tfoot>
            </table>
          </div>
          <button className="btn btn-primary" data-target="#exampleModal" data-toggle="modal" type="button">Cambiar plan</button>
        </form>
      </div>
    );
  }

}



export default MonthPlan
