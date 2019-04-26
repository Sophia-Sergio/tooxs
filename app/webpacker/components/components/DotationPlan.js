import React, { Component } from 'react';
import PropTypes from 'prop-types';

class DotationPlan extends Component {
  state = {
    dotation: [
      {
        dates: ['30','01','02','03','04','05','06'],
        shifts: [
          {
            shift_name: '11:00',
            current: [2, 7, 5, 9, 9, 4, 5],
            optimized: [3, 2, 2, 3, 3, 4, 3]
          },
          {
            shift_name: '12:00',
            current: [9, 7, 12, 9, 12, 7, 5],
            optimized: [4, 2, 3, 3, 4, 6, 3]
          },
          {
            shift_name: '13:00',
            current: [2, 7, 5, 9, 9, 4, 5],
            optimized: [3, 2, 2, 3, 3, 4, 3]
          },
          {
            shift_name: '14:00',
            current: [2, 7, 5, 9, 9, 4, 5],
            optimized: [3, 2, 2, 3, 3, 4, 3]
          },
          {
            shift_name: '15:00',
            current: [2, 7, 5, 9, 9, 4, 5],
            optimized: [3, 2, 2, 3, 3, 4, 3]
          },
          {
            shift_name: '16:00',
            current: [2, 7, 5, 9, 9, 4, 5],
            optimized: [3, 2, 2, 3, 3, 4, 3]
          },
          {
            shift_name: '17:00',
            current: [2, 7, 5, 9, 9, 4, 5],
            optimized: [3, 2, 2, 3, 3, 4, 3]
          },
          {
            shift_name: '18:00',
            current: [2, 7, 5, 9, 9, 4, 5],
            optimized: [3, 2, 2, 3, 3, 4, 3]
          },
          {
            shift_name: '19:00',
            current: [2, 7, 5, 9, 9, 4, 5],
            optimized: [3, 2, 2, 3, 3, 4, 3]
          },
          {
            shift_name: '20:00',
            current: [3, 10, 15, 17, 17, 4, 7],
            optimized: [6, 7, 8, 11, 11, 7, 8]
          },
        ]
      },
    ],
  }

  render () {
    const { dotation } = this.state;
    console.log( dotation );
    return (
      <div className="col-md-12 mb-2">
        <div className="card dashboard__table">
          <h5 className="card-title">Planificación de dotación</h5>
          <div className="table-responsive">
            <table className="table">
              <thead>
                <tr>
                  <th colSpan="8" style={{ fontSize: '12px', textAlign: 'center' }}>Semana 1</th>
                </tr>
                <tr style={{backgroundColor: '#D0EDFF'}}>
                  <th style={{ fontSize: '12px', textAlign: 'center' }}>Hora</th>
                  { dotation[0].dates.map( date => (
                      <th style={{ fontSize: '12px', textAlign: 'center' }}>{ date }</th>
                    ))
                  }
                </tr>
              </thead>
              <tbody>
                { dotation[0].shifts.map( (shift, index) => (
                    <tr>
                      <td style={{textAlign: 'center'}}>{ shift.shift_name }</td>
                      <td style={{textAlign: 'center'}}>
                        <span className="badge badge-pill badge-light">{ shift.current[0] }</span>
                        <span className="badge badge-pill badge-primary">{ shift.optimized[0] }</span>
                      </td>
                      <td style={{textAlign: 'center'}}>
                        <span className="badge badge-pill badge-light">{ shift.current[1] }</span>
                        <span className="badge badge-pill badge-primary">{ shift.optimized[1] }</span>
                      </td>
                      <td style={{textAlign: 'center'}}>
                        <span className="badge badge-pill badge-light">{ shift.current[2] }</span>
                        <span className="badge badge-pill badge-primary">{ shift.optimized[2] }</span>
                      </td>
                      <td style={{textAlign: 'center'}}>
                        <span className="badge badge-pill badge-light">{ shift.current[3] }</span>
                        <span className="badge badge-pill badge-primary">{ shift.optimized[3] }</span>
                      </td>
                      <td style={{textAlign: 'center'}}>
                        <span className="badge badge-pill badge-light">{ shift.current[4] }</span>
                        <span className="badge badge-pill badge-primary">{ shift.optimized[4] }</span>
                      </td>
                      <td style={{textAlign: 'center'}}>
                        <span className="badge badge-pill badge-light">{ shift.current[5] }</span>
                        <span className="badge badge-pill badge-primary">{ shift.optimized[5] }</span>
                      </td>
                      <td style={{textAlign: 'center'}}>
                        <span className="badge badge-pill badge-light">{ shift.current[6] }</span>
                        <span className="badge badge-pill badge-primary">{ shift.optimized[6] }</span>
                      </td>
                    </tr>
                  ))
                }
              </tbody>
            </table>
          </div>
        </div>
      </div>
    );
  }
}

export default DotationPlan;
