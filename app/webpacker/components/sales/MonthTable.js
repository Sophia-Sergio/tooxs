import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat } from '../helpers';

class MonthTable extends Component {
  constructor(props){
    super(props);
    this.state = {
      compared_stores: false,
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
    console.log(newProps);
    this.createDatasets();
  }

  createDatasets = () => {
    if ( this.props.datasets.length < 3 ){
      this.setState({
        compared_stores: true,
        compared_stores_title: `${this.props.datasets[0].label} vs ${this.props.datasets[1].label}`,
        store_1: this.props.datasets[0].data.map(item => ( parseInt(item) )),
        store_2: this.props.datasets[1].data.map(item => ( parseInt(item) )),
        store_1_vs_store_2: this.props.datasets[0].data.map( (real, index) => (
          (( ( parseInt(this.props.datasets[1].data[index]) - parseInt(real) ) / parseInt(real) ) * 100).toFixed(2)
        )),
      });
    } else {
      this.setState({
        compared_stores: false,
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
  }

  render() {
    const { real_vs_plan, real_vs_historic, compared_stores, compared_stores_title, store_1_vs_store_2 } = this.state;
    const { title, datasets } = this.props;
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
              { compared_stores ? (
                  <tfoot>
                    <tr>
                      <td className="bg-dark text-white">{ compared_stores_title }</td>
                      {store_1_vs_store_2.map(item => (
                        <td className="bg-secondary text-white">{ item }%</td>
                      ))}
                      <td className="bg-dark text-white">{ ( store_1_vs_store_2.reduce((total, num) => total + parseInt(num), 0) / store_1_vs_store_2.length ).toFixed(2) }%</td>
                    </tr>
                  </tfoot>
                ) : (
                  <tfoot>
                    <tr>
                      <td className="bg-dark text-white">Real vs Plan</td>
                      {real_vs_plan.map(item => (
                        <td className="bg-secondary text-white">{ item }%</td>
                      ))}
                      <td className="bg-dark text-white">{ ( real_vs_plan.reduce((total, num) => total + parseInt(num), 0) / real_vs_plan.length ).toFixed(2) }%</td>
                    </tr>
                    <tr>
                      <td className="bg-dark text-white">Real vs Histórico</td>
                      {real_vs_historic.map(item => (
                        <td className="bg-secondary text-white">{ item }%</td>
                      ))}
                      <td className="bg-dark text-white">{ ( real_vs_historic.reduce((total, num) => total + parseInt(num), 0) / real_vs_historic.length ).toFixed(2) }%</td>
                    </tr>
                  </tfoot>
                )
              }
            </table>
          </div>
        </div>
      </div>
    );
  }
}

export default MonthTable;
