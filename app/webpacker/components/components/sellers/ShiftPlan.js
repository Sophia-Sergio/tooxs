import React, { Component } from "react";

class ShiftPlan extends Component {
  constructor(props) {
    super(props);
  }
  render () {
    return (
      <div className="col-md-5">
        <div className="card dashboard__table mb-2">
          <h5 className="card-title">Planificación turnos mes siguiente</h5>
          <div className="table-responsive">
            <table className="table">
              <thead>
                <tr>
                  <th style={{ fontSize: '12px', textAlign: 'center' }}>Turno</th>
                  <th style={{ fontSize: '12px', textAlign: 'center' }}>Actual</th>
                  <th style={{ fontSize: '12px', textAlign: 'center' }}>Optimizado</th>
                  <th style={{ fontSize: '12px', textAlign: 'center' }}>Comprometido</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 1">T1</td>
                  <td style={{ textAlign: 'center' }}>3</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 2">T2</td>
                  <td style={{ textAlign: 'center' }}>3</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 3">T3</td>
                  <td style={{ textAlign: 'center' }}>3</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 4">T4</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 5">T5</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 6">T6</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 7">T7</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 8">T8</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 9">T9</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                  <td style={{ textAlign: 'center' }}>0</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 10">T10</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 11">T11</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>5</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                </tr>
                <tr>
                  <td style={{ textAlign: 'center' }} className="shifts" title="Turno 12">T12</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                </tr>
              </tbody>
              <tfoot>
                <tr className="bg-light">
                  <td style={{ textAlign: 'center' }} title="Turno 12">Total</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                  <td style={{ textAlign: 'center' }}>2</td>
                  <td style={{ textAlign: 'center' }}>1</td>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
      </div>
    );
  }
}

export default ShiftPlan