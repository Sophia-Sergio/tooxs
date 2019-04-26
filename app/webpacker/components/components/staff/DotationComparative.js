import React, { Component } from 'react';
import PropTypes from 'prop-types';

class DotationComparative extends Component {
  state = {
    dotation: {
      departments: [
        {
          name: 'Accesorios y carteras',
          report: [0, 0, 0, 0, 0, 0, 1, 1, 2, 2, 2],
        },
        {
          name: 'Deportes',
          report: [0, 0, 1, 1, 1, 0, -1, -1, -1, 0, 0],
        },
        {
          name: 'Moda Mujer',
          report: [1, 1, 1, 0, 0, 0, 0, 0, -1, -1, -1],
        },
        {
          name: 'Rincón Juvenil Mujer',
          report: [0, 0, 0, 0, 0, 0, -1, -1, 2, 2, 2],
        },
        {
          name: 'Rincón Juvenil Hombre',
          report: [1, 1, 1, 1, 0, 0, -1, -1, -1, -1, -1],
        },
        {
          name: '+/-',
          report: [2, 2, 3, 2, 1, 0, -2, -2, 1, 2, 2],
        },
      ]
    },
  }

  formatReport(value){
    console.log(value);
    return value > 0 ? 'badge-primary' : value < 0 ? 'badge-danger' : 'badge-light';
  }

  render () {
    const { dotation } = this.state;
    console.log( dotation );
    return (
      <React.Fragment>
        <div className="col-12 mb-2">
          <div className="card dashboard__chart">
            <h5 className="card-title">Dotación Real vs Optimizada</h5>
            <p className="card-text">
              <span className="badge badge-pill badge-primary">Exceso</span>
              <span className="badge badge-pill badge-danger ml-1">Faltante</span>
            </p>
            <div className="table-responsive">
              <table className="table">
                <thead>
                  <tr>
                    <th style={{ fontSize: '12px', textAlign: 'center' }}>Hora</th>
                    { dotation.departments.map( department => (
                        <th style={{ fontSize: '12px', textAlign: 'center' }}>{ department.name }</th>
                      ))
                    }
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td className="shift" style={{textAlign: 'center'}}>10 - 11</td>
                    { dotation.departments.map( department => (
                      <td style={{textAlign: 'center'}}>
                        <span
                          className={`badge badge-pill ${this.formatReport(department.report[0])}`}
                        >
                          { department.report[0] }
                        </span>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shift" style={{textAlign: 'center'}}>11 - 12</td>
                    { dotation.departments.map( department => (
                      <td style={{textAlign: 'center'}}>
                        <span
                          className={`badge badge-pill ${this.formatReport(department.report[1])}`}
                        >
                          { department.report[1] }
                        </span>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shift" style={{textAlign: 'center'}}>12 - 13</td>
                    { dotation.departments.map( department => (
                      <td style={{textAlign: 'center'}}>
                        <span
                          className={`badge badge-pill ${this.formatReport(department.report[2])}`}
                        >
                          { department.report[2] }
                        </span>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shift" style={{textAlign: 'center'}}>13 - 14</td>
                    { dotation.departments.map( department => (
                      <td style={{textAlign: 'center'}}>
                        <span
                          className={`badge badge-pill ${this.formatReport(department.report[3])}`}
                        >
                          { department.report[3] }
                        </span>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shift" style={{textAlign: 'center'}}>14 - 15</td>
                    { dotation.departments.map( department => (
                      <td style={{textAlign: 'center'}}>
                        <span
                          className={`badge badge-pill ${this.formatReport(department.report[4])}`}
                        >
                          { department.report[4] }
                        </span>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shift" style={{textAlign: 'center'}}>15 - 16</td>
                    { dotation.departments.map( department => (
                      <td style={{textAlign: 'center'}}>
                        <span
                          className={`badge badge-pill ${this.formatReport(department.report[5])}`}
                        >
                          { department.report[5] }
                        </span>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shift" style={{textAlign: 'center'}}>17 - 18</td>
                    { dotation.departments.map( department => (
                      <td style={{textAlign: 'center'}}>
                        <span
                          className={`badge badge-pill ${this.formatReport(department.report[6])}`}
                        >
                          { department.report[6] }
                        </span>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shift" style={{textAlign: 'center'}}>19 - 20</td>
                    { dotation.departments.map( department => (
                      <td style={{textAlign: 'center'}}>
                        <span
                          className={`badge badge-pill ${this.formatReport(department.report[7])}`}
                        >
                          { department.report[7] }
                        </span>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shift" style={{textAlign: 'center'}}>20 - 21</td>
                    { dotation.departments.map( department => (
                      <td style={{textAlign: 'center'}}>
                        <span
                          className={`badge badge-pill ${this.formatReport(department.report[8])}`}
                        >
                          { department.report[8] }
                        </span>
                      </td>
                    ))}
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default DotationComparative;
