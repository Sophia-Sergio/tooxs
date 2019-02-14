import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat } from '../helpers';
import Select from 'react-select';
import {Line} from 'react-chartjs-2';

class MonthTable extends Component {
  constructor(props){
    super(props);
    this.state = {
      plan: {},
      historic: {},
      real: {},
      real_vs_plan: [],
      real_vs_historic: [],
      title: this.props.title,
      datasets: this.props.datasets,
    }
  }

  componentWillMount = () => {
    let title = this.state.title;
    let datasets = this.state.datasets;
    console.log(this.props.title, this.props.datasets);
    this.setState({
      plan: this.props.datasets[0].data.map(item => ( parseInt(item) )),
      historic: this.props.datasets[1].data.map(item => ( parseInt(item) )),
      real: this.props.datasets[2].data.map(item => ( parseInt(item) )),
      real_vs_plan: this.props.datasets[2].data.map( (real, index) => (
        (( ( parseInt(this.props.datasets[0].data[index]) - parseInt(real) ) / parseInt(real) ) * 100).toFixed(2)
      )),
      real_vs_historic: this.props.datasets[2].data.map( (real, index) => (
        (( ( parseInt(this.props.datasets[1].data[index]) - parseInt(real) ) / parseInt(real) ) * 100).toFixed(2)
      )),
    });
  }

  getDifferencePercentage = (oldVal, newVal) => {
    ( ( newVal - oldVal ) / oldVal ) * 100
  }

  render() {
    const { real_vs_plan, real_vs_historic, title } = this.state;
    const { datasets } = this.state;
    return (
      <div className="col-12">
        <div className="card dashboard__table">
          <h5 className="card-title">Tabla comparativa de ventas</h5>

          <div className="table-responsive">
            <table className="table">
              <thead>
                <tr>
                  <th></th>
                  { title.map( title => (
                      <th
                        data-toggle="tooltip"
                        data-placement="top"
                        title={ title.tooltip }
                      >
                        { title.label }
                      </th>
                  )) }
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                { datasets.map( dataset => (
                    <tr>
                      <td className="shifts">{ dataset.label }</td>
                      {dataset.data.map( item => (
                        <td>${ currencyFormat(parseInt(item)) }</td>
                      ))}
                      <td>${ currencyFormat(dataset.data.reduce((total, num) => total + parseInt(num), 0)) }</td>
                    </tr>
                  )
                ) }
              </tbody>
              <tfoot>
                <tr>
                  <td className="bg-dark text-white">Real vs Plan</td>
                  {real_vs_plan.map(item => (
                    <td className="bg-secondary text-white">{ item }%</td>
                  ))}
                  <td className="bg-dark text-white">{ ( real_vs_plan.reduce((total, num) => total + parseInt(num), 0) / real_vs_historic.length ).toFixed(2) }%</td>
                </tr>
                <tr>
                  <td className="bg-dark text-white">Real vs Histórico</td>
                  {real_vs_historic.map(item => (
                    <td className="bg-secondary text-white">{ item }%</td>
                  ))}
                  <td className="bg-dark text-white">{ ( real_vs_historic.reduce((total, num) => total + parseInt(num), 0) / real_vs_historic.length ).toFixed(2) }%</td>
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
