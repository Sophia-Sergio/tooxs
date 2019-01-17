import React, { Component } from 'react';
import PropTypes from 'prop-types';

class StaffingMonth extends Component {
  render () {
    const { week_name, week } = this.props;
    return (
      <React.Fragment>
        <div className="col-md-6 mb-2">
          <div className="card dashboard__table">
            <h5 className="card-title">{ week_name }</h5>
            <div className="table-responsive">
              <table className="table-shift">
                <thead>
                  <tr>
                    <th className="text-center">Hora</th>
                    {week.days.map( day => (
                      <th className="text-center">{ day.day_name }</th>
                    ))}
                  </tr>
                  <tr>
                    <th className="text-center"></th>
                    {week.dates.map( date => (
                      <th className="text-center">{ date }</th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td className="shifts text-center">11:00</td>
                    {week.days.map( (day, index) => (
                      <td className="text-center">
                        <button type="button" class="dotation-tooltip" data-toggle="tooltip" data-html="true" title={day.shifts[0].shift_dotation.join(', ')}>
                          { day.shifts[0].shift_dotation.length }
                        </button>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shifts text-center">12:00</td>
                    {week.days.map( (day, index) => (
                      <td className="text-center">
                        <button type="button" class="dotation-tooltip" data-toggle="tooltip" data-html="true" title={day.shifts[1].shift_dotation.join(', ')}>
                          { day.shifts[1].shift_dotation.length }
                        </button>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shifts text-center">13:00</td>
                    {week.days.map( (day, index) => (
                      <td className="text-center">
                        <button type="button" class="dotation-tooltip" data-toggle="tooltip" data-html="true" title={day.shifts[2].shift_dotation.join(', ')}>
                          { day.shifts[2].shift_dotation.length }
                        </button>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shifts text-center">14:00</td>
                    {week.days.map( (day, index) => (
                      <td className="text-center">
                        <button type="button" class="dotation-tooltip" data-toggle="tooltip" data-html="true" title={day.shifts[3].shift_dotation.join(', ')}>
                          { day.shifts[3].shift_dotation.length }
                        </button>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shifts text-center">15:00</td>
                    {week.days.map( (day, index) => (
                      <td className="text-center">
                        <button type="button" class="dotation-tooltip" data-toggle="tooltip" data-html="true" title={day.shifts[4].shift_dotation.join(', ')}>
                          { day.shifts[4].shift_dotation.length }
                        </button>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shifts text-center">16:00</td>
                    {week.days.map( (day, index) => (
                      <td className="text-center">
                        <button type="button" class="dotation-tooltip" data-toggle="tooltip" data-html="true" title={day.shifts[5].shift_dotation.join(', ')}>
                          { day.shifts[5].shift_dotation.length }
                        </button>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shifts text-center">17:00</td>
                    {week.days.map( (day, index) => (
                      <td className="text-center">
                        <button type="button" class="dotation-tooltip" data-toggle="tooltip" data-html="true" title={day.shifts[5].shift_dotation.join(', ')}>
                          { day.shifts[5].shift_dotation.length }
                        </button>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shifts text-center">18:00</td>
                    {week.days.map( (day, index) => (
                      <td className="text-center">
                        <button type="button" class="dotation-tooltip" data-toggle="tooltip" data-html="true" title={day.shifts[6].shift_dotation.join(', ')}>
                          { day.shifts[6].shift_dotation.length }
                        </button>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shifts text-center">19:00</td>
                    {week.days.map( (day, index) => (
                      <td className="text-center">
                        <button type="button" class="dotation-tooltip" data-toggle="tooltip" data-html="true" title={day.shifts[7].shift_dotation.join(', ')}>
                          { day.shifts[7].shift_dotation.length }
                        </button>
                      </td>
                    ))}
                  </tr>
                  <tr>
                    <td className="shifts text-center">20:00</td>
                    {week.days.map( (day, index) => (
                      <td className="text-center">
                        <button type="button" class="dotation-tooltip" data-toggle="tooltip" data-html="true" title={day.shifts[8].shift_dotation.join(', ')}>
                          { day.shifts[8].shift_dotation.length }
                        </button>
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

export default StaffingMonth;