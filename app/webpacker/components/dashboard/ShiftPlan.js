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
          <p className="card-text">8 de 15</p>
        </div>
        <div className="card dashboard__table">
          <div className="table-responsive">
            <table className="table">
              <thead>
                <tr>
                  <th style={{ fontSize: '12px' }}>Turno</th>
                  <th style={{ fontSize: '12px' }}>Actual</th>
                  <th style={{ fontSize: '12px' }}>Optimizado</th>
                  <th style={{ fontSize: '12px' }}>Comprometido</th>
                  <th style={{ fontSize: '12px' }}>Diferencia</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td className="shifts" title="Turno 1">T1</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                </tr>
                <tr>
                  <td className="shifts" title="Turno 2">T2</td>
                  <td>2</td>
                  <td>0</td>
                  <td>2</td>
                  <td>0</td>
                </tr>
                <tr>
                  <td className="shifts" title="Turno 3">T3</td>
                  <td>2</td>
                  <td>2</td>
                  <td>2</td>
                  <td>2</td>
                </tr>
                <tr>
                  <td className="shifts" title="Turno 4">T4</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                </tr>
                <tr>
                  <td className="shifts" title="Turno 5">T5</td>
                  <td>1</td>
                  <td>2</td>
                  <td>1</td>
                  <td>2</td>
                </tr>
                <tr>
                  <td className="shifts" title="Turno 6">T6</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                  <td>1</td>
                </tr>
                <tr>
                  <td className="shifts" title="Turno 7">T7</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                </tr>
                <tr>
                  <td className="shifts" title="Turno 8">T8</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                  <td>0</td>
                </tr>
                <tr>
                  <td className="shifts" title="Turno 9">T9</td>
                  <td>0</td>
                  <td>1</td>
                  <td>0</td>
                  <td>1</td>
                </tr>
                <tr>
                  <td className="shifts" title="Turno 10">T10</td>
                  <td>2</td>
                  <td>2</td>
                  <td>2</td>
                  <td>2</td>
                </tr>
                <tr>
                  <td className="shifts" title="Turno 11">T11</td>
                  <td>0</td>
                  <td>2</td>
                  <td>0</td>
                  <td>2</td>
                </tr>
                <tr>
                  <td className="shifts" title="Turno 12">T12</td>
                  <td>0</td>
                  <td>3</td>
                  <td>0</td>
                  <td>3</td>
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