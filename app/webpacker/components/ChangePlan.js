import React, { Component } from "react";
import PropTypes from "prop-types";
import { currencyFormat } from "./helpers";

class ChangePlan extends Component {

  handleClick(e) {
    e.preventDefault();
    consol.log('clicked');
  }

  handleChange(e) {

  }

  state = {
    year: 2018,
    month: {
      id: 1,
      name: 'Junio',
      weeks: [
        {
          id: 1,
          name: 'Semana 1',
          plan: 47770108
        },
        {
          id: 2,
          name: 'Semana 2',
          plan: 47770108
        },
        {
          id: 3,
          name: 'Semana 3',
          plan: 47770108
        },
        {
          id: 4,
          name: 'Semana 4',
          plan: 47770108
        },
      ]
    },
    percentage_1: 0,
    percentage_2: 0,
    percentage_3: 0,
    percentage_4: 0,
    amount_1: 0,
    amount_2: 0,
    amount_3: 0,
    amount_4: 0,
    total: 191080432
  }

  onChange = e => this.setState({ [e.target.name]: e.target.value });

  render () {
    const { month, total } = this.state;
    const formatter = new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    });

    return (
      <div className="card mb-4" style={{padding: '15px'}}>
        <h3 className="change-plans__cont__title" style={{fontSize: '18px'}}>
          {this.props.monthname} <span style={{color: '#6c757d', fontWeight: 400}}>de 2018</span>
        </h3>
        <form className="change-plans__form">
          <div className="table-responsive">
            <table className="table mb-2">
              <thead className="thead bg-primary text-white">
                <tr>
                  <th></th>
                  {month.weeks.map(item => (
                    <th>{item.name}</th>
                  ))}
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Plan</td>
                  {month.weeks.map(item => (
                    <td id={'week-' + item.id} key={item.id}>${currencyFormat(item.plan)}</td>
                  ))}
                  <td>
                    ${currencyFormat( month.weeks.reduce((prev, cur) => { return prev + cur.plan;}, 0) )}
                  </td>
                </tr>
                <tr>
                  <td>Ajuste en %</td>
                  {month.weeks.map((item, index) => (
                    <td key={item.id}>
                      <div className="input-group input-group-sm">
                        <input
                          className="form-control"
                          data-target={'#week-' + item.id}
                          name={'percentage_' + item.id}
                          onChange={this.onChange}
                          type="number"max="200"
                          value={this.state.percentage_1}
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
                  {month.weeks.map(item => (
                    <td key={item.id}>
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
                  {month.weeks.map(item => (
                    <th>
                      ${currencyFormat(item.plan)}
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

ChangePlan.defaultProps = {
  title: 'Dashboard title'
};

ChangePlan.propTypes = {
  title: PropTypes.string.isRequired
};

export default ChangePlan
