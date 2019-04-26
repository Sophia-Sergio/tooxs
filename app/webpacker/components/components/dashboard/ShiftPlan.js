import React, { Component } from "react";

class ShiftPlan extends Component {
  constructor(props) {
    super(props);
  }
  render () {
    return (
      <div className="col-md-5">
        <div className="card dashboard__progress mb-2">
          <h5 className="card-title">Planificación turnos mes siguiente</h5>
          <div className="progress">
            <div className="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style={{ width: '53%' }}></div>
          </div>
          <p className="card-text">12 de los 15 colaboradores óptimos se han comprometido</p>
          <div className="table-responsive">
            <h5 className="card-title">Colaboradores por turno</h5>
            <table className="table">
              <thead>
                <tr>
                  <th style={{ fontSize: '12px', borderTop: 'none', textAlign: 'center' }}>
                    Turno
                  </th>
                  <th style={{ fontSize: '12px', borderTop: 'none', textAlign: 'center' }}>
                    <span data-toggle="tooltip" data-placement="top"
                      title="Dotación actual mayo">
                      Actual
                    </span>
                  </th>
                  <th style={{ fontSize: '12px', borderTop: 'none', textAlign: 'center' }}>
                    <span data-toggle="tooltip" data-placement="top"
                      title="Dotación óptima mayo">
                      Óptimo
                    </span>
                  </th>
                  <th style={{ fontSize: '12px', borderTop: 'none', textAlign: 'center' }}>
                    <span data-toggle="tooltip" data-placement="top"
                      title="Dotación comprometida mayo">
                      Comprometido
                    </span>
                  </th>
                  <th style={{ fontSize: '12px', borderTop: 'none', textAlign: 'center' }}>
                    <span data-toggle="tooltip" data-placement="top"
                      title="Dif. óptimo/comprometido">
                      Diferencia
                    </span>
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 1">T1</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 2">T2</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>-1</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 3">T3</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 4">T4</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 5">T5</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 6">T6</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 7">T7</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 8">T8</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 9">T9</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 10">T10</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 11">T11</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 12">T12</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>3</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    );
  }
}

export default ShiftPlan