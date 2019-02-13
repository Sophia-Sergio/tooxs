import React, { Component } from 'react';
import axios from 'axios';
import { currencyFormat } from '../helpers';
import { Line } from 'react-chartjs-2';

class MonthTable extends Component {
  constructor(props){
    super(props);
    this.state = {
      real_vs_plan: [],
      real_vs_historic: [],
      title: this.props.title,
      datasets: this.props.datasets,
    }
  }

  componentWillMount = () => {
    this.createComparedData();
  }

  getPercentageChange = (oldNumber, newNumber) => {
    var decreaseValue = oldNumber - newNumber;
    return ((decreaseValue / oldNumber) * 100).toFixed(2);
  }

  createComparedData = () => {
    let real = this.props.datasets[0].data;
    let hist = this.props.datasets[1].data;
    let plan = this.props.datasets[2].data;
    var real_vs_plan = real.map((num, i) => {
      let oldNum = parseInt(num);
      let newNum = parseInt(plan[i]);
      return this.getPercentageChange(oldNum, newNum);
    });
    var real_vs_historic = real.map((num, i) => {
      let oldNum = parseInt(num);
      let newNum = parseInt(hist[i]);
      return this.getPercentageChange(oldNum, newNum);
    });
    this.setState({
      real_vs_plan: real_vs_plan,
      real_vs_historic: real_vs_historic,
    });
    console.log({real, hist, real_vs_historic});
  }

  render() {
    const { real_vs_plan, real_vs_historic } = this.state;
    return (
      <div className="col-12">
        <div className="card dashboard__table">
          <h5 className="card-title">Mayo 2018</h5>
          <div className="table-responsive">
            <table className="table">
              <thead>
                <tr>
                  <th></th>
                  { this.props.title.map( (item, i) => (
                      <th>
                        <span
                          key={i}
                          data-toggle="tooltip"
                          data-placement="top"
                          title={ item.tooltip }
                        >
                          { item.label }
                        </span>
                      </th>
                    ))
                  }
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                { this.props.datasets.map( dataset => (
                  <tr>
                    <td className="shifts">{ dataset.label }</td>
                    { dataset.data.map( d => (
                      <td>${ currencyFormat(parseInt(d)) }</td>
                    )) }
                    <td className="total">${ currencyFormat( dataset.data.reduce((total, amount) => total + parseInt(amount), 0) ) }</td>
                  </tr>
                )) }
              </tbody>
              <tfoot>
                <tr className="bg-secondary">
                  <td className="text-white">Real vs Plan</td>
                  {real_vs_plan.map(item => (
                    <td className="text-white">{ item }%</td>
                  ))}
                </tr>
                <tr className="bg-secondary">
                  <td className="text-white">Real vs Histórico</td>
                  {real_vs_historic.map(item => (
                    <td className="text-white">{ item }%</td>
                  ))}
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
      </div>
    );
  }
}

export default MonthTable;
