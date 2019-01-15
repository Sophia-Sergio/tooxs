import React, { Component } from 'react';
import PropTypes from 'prop-types';

class DotationTable extends Component {
  state = {
    shifts: [
      {
        id: 1,
        name: 'Turno 1 de 45 horas',
        current_dotation: 7,
        optimized_dotation: 1
      },
      {
        id: 2,
        name: 'Turno 2 de 45 horas',
        current_dotation: 3,
        optimized_dotation: 0
      },
      {
        id: 3,
        name: 'Turno 3 de 45 horas',
        current_dotation: 2,
        optimized_dotation: 2
      },
      {
        id: 4,
        name: 'Turno 4 de 45 horas',
        current_dotation: 0,
        optimized_dotation: 1
      },
      {
        id: 5,
        name: 'Turno 1 de 36 horas',
        current_dotation: 0,
        optimized_dotation: 1
      },
      {
        id: 6,
        name: 'Turno 2 de 36 horas',
        current_dotation: 0,
        optimized_dotation: 1
      },
      {
        id: 7,
        name: 'Turno 3 de 36 horas',
        current_dotation: 0,
        optimized_dotation: 1
      },
      {
        id: 8,
        name: 'Turno 4 de 36 horas',
        current_dotation: 0,
        optimized_dotation: 1
      },
      {
        id: 9,
        name: 'Turno 1 de 24 horas',
        current_dotation: 2,
        optimized_dotation: 1
      },
      {
        id: 10,
        name: 'Turno Sábado - Domingo',
        current_dotation: 2,
        optimized_dotation: 2
      },
      {
        id: 11,
        name: 'Turno 1 Tarde',
        current_dotation: 0,
        optimized_dotation: 2
      },
      {
        id: 12,
        name: 'Turno 2 Tarde',
        current_dotation: 3,
        optimized_dotation: 3
      },
    ],
  }

  render () {
    const { shifts } = this.state;
    return (
      <div className="col-md-12 mb-2">
        <div className="card dashboard__table">
          <h5 className="card-title">Planificación de dotación</h5>
          <div className="table-responsive">
            <table className="table">
              <thead>
                <tr>
                  <th style={{ fontSize: '12px', textAlign: 'center' }}>ID</th>
                  <th style={{ fontSize: '12px', textAlign: 'center' }}>Turno</th>
                  <th style={{ fontSize: '12px', textAlign: 'center' }}>Dotación actual</th>
                  <th style={{ fontSize: '12px', textAlign: 'center' }}>Dotación optimizada</th>
                </tr>
              </thead>
              <tbody>
                {shifts.map( shift => (
                  <tr>
                    <td style={{ textAlign: 'center' }} className="shifts" title={ 'Turno ' + shift.name }>Turno { shift.id }</td>
                    <td style={{ textAlign: 'center' }}>{ shift.name }</td>
                    <td style={{ textAlign: 'center' }}>{ shift.current_dotation }</td>
                    <td style={{ textAlign: 'center' }}>{ shift.optimized_dotation }</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    );
  }
}

export default DotationTable;
