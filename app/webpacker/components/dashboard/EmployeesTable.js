import React, { Component } from "react"
import PropTypes from "prop-types"
import Employee from '../Employee'
import DefaultAvatar from '../../images/user_default.jpg'

class EmployeesTable extends Component {
  state = {
    tableHead: {
      id: 1,
      avatar: '',
      name: 'Colaborador',
      sell: 'Ventas',
      goal: 'Meta',
      shifts: 'Turno',
      objective: 'Cumplimiento',
      link: ''
    },
    employees: [
      {
        id: 1,
        avatar: '',
        name: 'Ricardo Gonzalez',
        sell: 16875507,
        goal: 36672521,
        shifts: '1',
        objective: 46.02,
        link: '/sellers/1'
      },
      {
        id: 2,
        avatar: '',
        name: 'Claudia Bravo Lopez',
        sell: 17873735,
        goal: 31619145,
        shifts: '2',
        objective: 56.53,
        link: '/sellers/2'
      },
      {
        id: 3,
        avatar: '',
        name: 'Juan Herrera',
        sell: 17854275,
        goal: 31619145,
        shifts: '2',
        objective: 56.47,
        link: '/sellers/3'
      },
      {
        id: 4,
        avatar: '',
        name: 'Ulises Medina',
        sell: 16459648,
        goal: 32187806,
        shifts: '3',
        objective: 51.14,
        link: '/sellers/4'
      },
      {
        id: 5,
        avatar: '',
        name: 'Rodrigo Sanz',
        sell: 16436461,
        goal: 17140530,
        shifts: '3',
        objective: 51.06,
        link: '/sellers/4'
      },
    ]
  }
  render () {
    const { tableHead, employees } = this.state;

    return (
      <div className="card dashboard__table">
        <div className="table-responsive">
          <table className="table">
            <thead>
              <tr>
                <th>{tableHead.avatar}</th>
                <th>{tableHead.name}</th>
                <th>{tableHead.sell}</th>
                <th>{tableHead.goal}</th>
                <th>{tableHead.shift}</th>
                <th>{tableHead.objective}</th>
                <th>{tableHead.link}</th>
              </tr>
            </thead>
            <tbody>
              {employees.map(employee => (
                <Employee
                  key={employee.id}
                  avatar={(employee.avatar != '') ? employee.avatar : DefaultAvatar}
                  employee={employee}
                />
              ))}
            </tbody>
          </table>
        </div>
      </div>
    );
  }
}

EmployeesTable.defaultProps = {
  title: 'Dashboard title'
};

EmployeesTable.propTypes = {
  title: PropTypes.string.isRequired
};

export default EmployeesTable