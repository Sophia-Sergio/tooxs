import React, { Component } from 'react';
import PropTypes from 'prop-types';

class StaffingMonth extends Component {
  constructor(props){
    super(props);
    this.state = {
      week_days: ['L', 'M', 'M', 'J', 'V', 'S', 'D'],
      week_shifts: [],
    }
  }

  componentDidMount = () => {
    this.createWeekShifts();
  }

  componentWillReceiveProps = (newProps) => {
    this.createWeekShifts();
  }

  createWeekShifts = () => {
    const week = this.props.week;
    const maxDayShifts = week.reduce( (prev, current) => (prev.shifts > current.shifts) ? prev : current);
    const shifts = maxDayShifts.shifts.map( shift => ( { name: shift.name, employees: [] } ) );
    this.setState({
      week_shifts: shifts,
    });
  }

  getCurrentShift = (day_arr, shift_name) => {
    let shift = day_arr.filter( day_shift => { return day_shift.name === shift_name });
    let result = '';
    if (shift.length) {
      result =
        <button
          type="button"
          className="dotation-tooltip"
          data-toggle="tooltip"
          data-html="true"
          title={ shift[0].employees.map( employee => ( ' ' + employee  ) ) }
        >
          { shift[0].employees.length }
        </button>
      ;
    }
    return result;
  }

  render () {
    const { week_name, week } = this.props;
    const { week_days, week_shifts } = this.state;
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
                      { week_days.map( (day, index) => (
                        <th key={ index } className="text-center">{ day }</th>
                      )) }
                    </tr>
                  <tr>
                  <th className="text-center bg-light"></th>
                    {week.map( (day, index) => (
                      <th key={ index } className="text-center font-weight-light bg-light">{ new Date(day.date).getDate() }</th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  { week_shifts.map( (shift, i) => (
                    <tr key={i}>
                      <td className="shifts text-center">{ shift.name }</td>
                      { week.map( (day, j) => (
                        <React.Fragment>
                          <td key={j} className="text-center">
                          {
                            this.getCurrentShift(day.shifts, shift.name)
                          }
                          </td>
                        </React.Fragment>
                      )) }
                    </tr>
                  )) }
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
