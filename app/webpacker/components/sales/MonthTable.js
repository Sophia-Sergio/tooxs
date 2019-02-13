import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat } from '../helpers';
import Select from 'react-select';
import {Line} from 'react-chartjs-2';

class MonthTable extends Component {
  constructor(props){
    super(props);
    this.state = {
      plan: [44881213, 45163912, 45552588, 45127781, 180725494],
      real: [42532992, 42899028, 43361349, 44010026, 172803395],
      historic: [41556681, 41818439, 42178324, 41784991, 167338435],
      real_vs_plan: ['-5.23%', '-5,01%', '-4,81%', '-2,48%', '-4,38%'],
      real_vs_historic: ['2,35%', '2,58%', '2,8%', '5,32%', '3,27%'],
      title: this.props.title,
      datasets: this.props.datasets,
    }
  }

  componentWillMount = () => {
    let title = this.state.title;
    let datasets = this.state.datasets;
    console.log(this.props.title, this.props.datasets);
  }

  render() {
    const { plan, real, historic, real_vs_plan, real_vs_historic, title, datasets } = this.state;
    return (
      <div className="col-12">
        <div className="card dashboard__table">
          <h5 className="card-title">Tabla comparativa de ventas</h5>
        </div>
        <div className="table-responsive">
          <table className="table">
            <thead>
              <tr>
                <th></th>
                { this.props.title.map( title => (
                    <th
                      className="btn btn-secondary"
                      data-toggle="tooltip"
                      data-placement="top"
                      title="Tooltip on top"
                    >
                      { title.label }
                    </th>
                )) }
                <th>Total</th>
              </tr>
            </thead>
          </table>
        </div>
      </div>
      //
      //
      //         <thead>
      //           <tr>
      //             <th></th>
      //             { this.props.title.labels.map( label => (
      //                 <th class="btn btn-secondary" data-toggle="tooltip" data-placement="top" title="Tooltip on top">{ label }</th>
      //               ))
      //             }
      //             <th>Total</th>
      //           </tr>
      //         </thead>
      //         <tbody className="">
      //           <tr>
      //             <td className="shifts">Plan</td>
      //             {plan.map(item => (
      //               <td>${ currencyFormat(item) }</td>
      //             ))}
      //           </tr>
      //           <tr>
      //             <td className="shifts">Real</td>
      //             {real.map(item => (
      //               <td>${ currencyFormat(item) }</td>
      //             ))}
      //           </tr>
      //           <tr>
      //             <td className="shifts">Historico</td>
      //             {historic.map(item => (
      //               <td>${ currencyFormat(item) }</td>
      //             ))}
      //           </tr>
      //         </tbody>
      //         <tfoot>
      //           <tr className="bg-secondary">
      //             <td className="text-white">Real vs Plan</td>
      //             {real_vs_plan.map(item => (
      //               <td className="text-white">{ item }</td>
      //             ))}
      //           </tr>
      //           <tr className="bg-secondary">
      //             <td className="text-white">Real vs Histórico</td>
      //             {real_vs_historic.map(item => (
      //               <td className="text-white">{ item }</td>
      //             ))}
      //           </tr>
      //         </tfoot>
      //       </table>
      //     </div>
      //   </div>
      // </div>
    );
  }
}

export default MonthTable;
