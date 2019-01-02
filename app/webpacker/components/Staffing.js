import React, { Component } from "react"
import PropTypes from "prop-types"
import Employee from './Employee'
import DefaultAvatar from '../images/user_default.jpg'

class Staffing extends Component {
  constructor(props) {
    super(props);
    this.state = {
      weeks: [
        {
          days: [
            {
              number: '03',
              sellers: ['Ulises Medina', 'Rodrigo Sanz']
            },
            {
              number: '04',
              sellers: ['Ulises Medina', 'Rodrigo Sanz']
            },
            {
              number: '05',
              sellers: ['Ulises Medina', 'Rodrigo Sanz']
            },
            {
              number: '06',
              sellers: ['Ulises Medina', 'Rodrigo Sanz']
            },
            {
              number: '07',
              sellers: ['Ulises Medina', 'Rodrigo Sanz']
            },
            {
              number: '08',
              sellers: ['Ulises Medina', 'Rodrigo Sanz']
            },
            {
              number: '09',
              sellers: ['Ulises Medina', 'Rodrigo Sanz']
            }
          ]
        },
      ],
    };
  }

  tooltipTemplate(sellers) {
    return (
      <button type="button" class="btn btn-secondary" data-toggle="tooltip" data-placement="left" title={sellers}>
        {sellers}
      </button>
    );
  }

  render () {
    console.log(this.props.data);
    const { tableTitle, weeks, dates, employees } = this.state;

    return (
      <div className="row">
        <div className="col-md-6">
          <div className="card dashboard__table">
          <h5 className="card-title">Semana 1</h5>
            <div className="table-responsive">
              <table className="table-shift table table-striped">
                <thead>
                  <tr>
                    <th className="text-center">Hora</th>
                    <th className="text-center">L</th>
                    <th className="text-center">M</th>
                    <th className="text-center">M</th>
                    <th className="text-center">J</th>
                    <th className="text-center">V</th>
                    <th className="text-center">S</th>
                    <th className="text-center">D</th>
                  </tr>
                  <tr>
                    <th className="text-center"></th>
                    {dates.map(date => <th className="text-center">{date}</th>)}
                  </tr>
                </thead>
                <tbody className="t-p-3">
                  {weeks[0].days.map(day => <th className="text-center">{day}</th>)}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

Staffing.defaultProps = {
  title: 'Dashboard title'
};

Staffing.propTypes = {
  title: PropTypes.string.isRequired
};

export default Staffing