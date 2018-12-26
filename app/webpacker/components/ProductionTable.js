import React, { Component } from 'react';
import PropTypes from 'prop-types';
import DatePicker from "react-datepicker";

class ProductionTable extends Component {
  state = {
    startDate: new Date(),
    tableHead: ['Horario', 'Carnes', 'Fiambrería y Quesos', 'Pescados y Maríscos'],
    departments: [
      {
        id: 1,
        shiftName: '8 - 9',
        department_1: 4,
        department_2: 4,
        department_3: 4,
      },
      {
        id: 2,
        shiftName: '9 - 10',
        department_1: 4,
        department_2: 4,
        department_3: 4,
      },
      {
        id: 3,
        shiftName: '10 - 11',
        department_1: 4,
        department_2: 4,
        department_3: 4,
      },
      {
        id: 4,
        shiftName: '11 - 12',
        department_1: 4,
        department_2: 4,
        department_3: 4,
      },
      {
        id: 5,
        shiftName: '12 - 13',
        department_1: 4,
        department_2: 4,
        department_3: 4,
      },
      {
        id: 6,
        shiftName: '13 - 14',
        department_1: 3,
        department_2: 2,
        department_3: 3,
      },
      {
        id: 7,
        shiftName: '14 - 15',
        department_1: 3,
        department_2: 2,
        department_3: 3,
      },
      {
        id: 8,
        shiftName: '15 - 16',
        department_1: 3,
        department_2: 2,
        department_3: 3,
      },
      {
        id: 9,
        shiftName: '16 - 17',
        department_1: 3,
        department_2: 2,
        department_3: 3,
      },
      {
        id: 10,
        shiftName: '17 - 18',
        department_1: 4,
        department_2: 2,
        department_3: 4,
      },
      {
        id: 11,
        shiftName: '19 - 20',
        department_1: 4,
        department_2: 3,
        department_3: 4,
      },
      {
        id: 12,
        shiftName: '20 - 21',
        department_1: 4,
        department_2: 3,
        department_3: 4,
      },
      {
        id: 13,
        shiftName: '21 - 22',
        department_1: 4,
        department_2: 3,
        department_3: 4,
      },
    ]
  }
  render () {
    const { startDate, tableHead, departments } = this.state;

    return (
      <React.Fragment>
        <div className="card dashboard__filter mb-2">
          <form>
            <div className="form-group">
              <DatePicker selected={startDate} />
            </div>
            <button>Buscar</button>
          </form>
        </div>
        <div className="card dashboard__table">
          <div className="table-responsive">
            <h5 className="card-title">Dotación</h5>
            <table className="table">
              <thead className="bg-primary text-light">
                <tr>
                  {tableHead.map((th, index) => (
                    <th className="text-center" key={index} width={ 100 / tableHead.length + "%" }>{th}</th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {departments.map(department => (
                  <tr key={department.id}>
                    <th className="bg-light text-secondary text-center" scope="row">{department.shiftName}</th>
                    <td className="text-center">{department.department_1}</td>
                    <td className="text-center">{department.department_2}</td>
                    <td className="text-center">{department.department_3}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default ProductionTable
