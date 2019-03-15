import React, { Component } from 'react';
import axios from 'axios';
import { currencyFormat } from '../helpers';

class MonthTable extends Component {
  constructor(props){
    super(props);
    this.state = {
      plan: {},
      historic: {},
      real: {},
      real_vs_plan: [],
      real_vs_historic: [],
      store_1: {},
      store_2: {},
      store_1_vs_store_2: []
    }
  }

  componentWillReceiveProps = (newProps) => {
    !this.props.isCompared && this.createDatasets();
  }

  createDatasets = () => {
    const { title, datasets } = this.props;
    this.setState({
      plan: this.props.datasets[0].data.map(item => ( parseInt(item) )),
      historic: this.props.datasets[1].data.map(item => ( parseInt(item) )),
      real: this.props.datasets[2].data.map(item => ( parseInt(item) )),
      real_vs_plan: this.props.datasets[2].data.map( (real, index) => (
        (( ( parseInt(this.props.datasets[0].data[index]) - parseInt(real) ) / parseInt(real) ) * 100).toFixed(2)
      )),
      real_vs_historic: this.props.datasets[1].data.map( (real, index) => (
        (( ( parseInt(this.props.datasets[0].data[index]) - parseInt(real) ) / parseInt(real) ) * 100).toFixed(2)
      )),
    });
  }

  getPercentageDifference = (val, index) => {
    let percentage = (( ( this.props.datasets[0].data[index] - parseInt(val) ) / parseInt(val) ) * 100).toFixed(2);
    if (isNaN(percentage)){
      percentage = 0;
    }
    return percentage;
  }

  render() {
    const { real_vs_plan, real_vs_historic, compared_stores, compared_stores_title, store_1_vs_store_2 } = this.state;
    const { isCompared, title, datasets } = this.props;
    return (
      <div className="col-12">
        <div className="card dashboard__table">
          <h5 className="card-title">Tabla comparativa de ventas</h5>

          <div className="table-responsive">
            <table className="table">
              <thead>
                <tr>
                  <th></th>
                  { title.map( (title, index) => (
                      <th key={ index }>
                        <span className="table-tooltip">
                          { title.label }
                          <div className="table-tooltip__text">{ title.tootlip }</div>
                        </span>
                      </th>
                  )) }
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                { datasets.map( (dataset, index) => (
                    <tr>
                      <td
                        className={ (isCompared && index === 0) ? 'bg-primary text-white' : 'shifts' }
                        style={{whiteSpace: 'nowrap'}}
                      >
                        { dataset.label }
                      </td>
                      {dataset.data.map( (item, i) => (
                        <td className={ ( isCompared && index === 0) && 'shifts' }>
                          ${ currencyFormat(parseInt(item)) }
                          { (index != 0 && this.props.isCompared) &&
                            <span className={'difference ' + (this.getPercentageDifference(item, i) >= 0 ? 'positive' : 'negative') }>
                              { this.getPercentageDifference(item, i) }%
                            </span>
                          }
                        </td>
                      ))}
                      <td
                        className={ (isCompared && index === 0) && 'shifts' }
                      >
                        ${ currencyFormat(dataset.data.reduce((total, num) => total + parseInt(num), 0)) }
                      </td>
                    </tr>
                  )
                ) }
              </tbody>
              { !this.props.isCompared &&
                <tfoot>
                  <tr>
                    <td className="bg-dark text-white" style={{whiteSpace: 'nowrap'}}>Real vs Plan</td>
                    {real_vs_plan.map(item => (
                      <td className="bg-secondary text-white">{ item }%</td>
                    ))}
                    <td className="bg-dark text-white">{ ( real_vs_plan.reduce((total, num) => total + parseInt(num), 0) / real_vs_plan.length ).toFixed(2) }%</td>
                  </tr>
                  <tr>
                    <td className="bg-dark text-white" style={{whiteSpace: 'nowrap'}}>Real vs Histórico</td>
                    {real_vs_historic.map(item => (
                      <td className="bg-secondary text-white">{ item }%</td>
                    ))}
                    <td className="bg-dark text-white">{ ( real_vs_historic.reduce((total, num) => total + parseInt(num), 0) / real_vs_historic.length ).toFixed(2) }%</td>
                  </tr>
                </tfoot>
              }
            </table>
          </div>
        </div>
      </div>
    );
  }
}

export default MonthTable;
