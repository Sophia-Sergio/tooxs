import React, { Component } from "react"
import PropTypes from "prop-types"
import Employee from './Employee'
import DefaultAvatar from '../images/user_default.jpg'

class Staffing extends Component {
  state = {
    tableTitle: 'Semana 1',
    dates: ['03', '04', '05', '06', '07', '08', '09'],
    employees: [
      {
        id: 1,
        avatar: '',
        name: 'Ricardo Gonzalez',
        sell: 16875507,
        goal: 36672521,
        shift: '1',
        objective: 46.02,
        link: '/sellers/1'
      },
      {
        id: 2,
        avatar: '',
        name: 'Claudia Bravo Lopez',
        sell: 17873735,
        goal: 31619145,
        shift: '2',
        objective: 56.53,
        link: '/sellers/2'
      },
      {
        id: 3,
        avatar: '',
        name: 'Juan Herrera',
        sell: 17854275,
        goal: 31619145,
        shift: '2',
        objective: 56.47,
        link: '/sellers/3'
      },
      {
        id: 4,
        avatar: '',
        name: 'Ulises Medina',
        sell: 16459648,
        goal: 32187806,
        shift: '3',
        objective: 51.14,
        link: '/sellers/4'
      },
      {
        id: 5,
        avatar: '',
        name: 'Rodrigo Sanz',
        sell: 16436461,
        goal: 17140530,
        shift: '3',
        objective: 51.06,
        link: '/sellers/4'
      },
    ]
  }
  render () {
    const { tableTitle, dates, employees } = this.state;

    return (
      <div className="col-md-6">
        <div className="card dashboard__table">
          <div className="dashboard__table__title">{tableTitle}</div>
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
              </tbody>
            </table>
          </div>
        </div>
      </div>
    );
  }
}

export default Staffing