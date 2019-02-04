import React, { Component } from "react";

class MyAvailableShifts extends Component {
  constructor(props) {
    super(props);
  }
  render () {
    return (
      <React.Fragment>
        <table className="table">
          <thead>
            <tr>
              <th style={{ fontSize: '12px', textAlign: 'center' }}>Turno disponible</th>
              <th style={{ fontSize: '12px', textAlign: 'center' }}>Descripción</th>
              <th style={{ fontSize: '12px', textAlign: 'center' }}>Cantidad</th>
              <th style={{ fontSize: '12px', textAlign: 'center' }}>Seleccionar</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td style={{ textAlign: 'center' }} className="shifts" title="Turno 1">T7</td>
              <td style={{ textAlign: 'center' }}>Turno 3 de 36 horas</td>
              <td style={{ textAlign: 'center' }}>1</td>
              <td className="text-center">
                <input type="checkbox" />
              </td>
            </tr>
            <tr>
              <td style={{ textAlign: 'center' }} className="shifts" title="Turno 1">T10</td>
              <td style={{ textAlign: 'center' }}>Turno Sábado - Domingo</td>
              <td style={{ textAlign: 'center' }}>1</td>
              <td className="text-center">
                <input type="checkbox" />
              </td>
            </tr>
            <tr>
              <td style={{ textAlign: 'center' }} className="shifts" title="Turno 1">T11</td>
              <td style={{ textAlign: 'center' }}>Turno 1 Tarde</td>
              <td style={{ textAlign: 'center' }}>1</td>
              <td className="text-center">
                <input type="checkbox" />
              </td>
            </tr>
            <tr>
              <td style={{ textAlign: 'center' }} className="shifts" title="Turno 1">T12</td>
              <td style={{ textAlign: 'center' }}>Turno 2 Tarde</td>
              <td style={{ textAlign: 'center' }}>1</td>
              <td className="text-center">
                <input type="checkbox" />
              </td>
            </tr>
          </tbody>
        </table>
        <div class="d-flex justify-content-end mb-2">
          <button name="button" type="submit" class="btn btn-primary">Postular</button>
        </div>
      </React.Fragment>
    );
  }
}

export default MyAvailableShifts;