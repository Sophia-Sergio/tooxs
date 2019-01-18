import React, { Component } from 'react';
import Select from 'react-select';
import DayPickerInput from 'react-day-picker/DayPickerInput';
import MomentLocaleUtils, { formatDate, parseDate,} from 'react-day-picker/moment';
import 'moment/locale/es';
import PropTypes from 'prop-types';

class ProductionTable extends Component {
  state = {
    loading: false,
    departmentDefault: { value: '1', label: 'Alto Las Condes' },
    department: { value: '1', label: 'Alto Las Condes' },
    departmentOptions: [
      { value: '1', label: 'Alto Las Condes' },
      { value: '2', label: 'Parque Arauco' },
      { value: '3', label: 'Costanera Center' }
    ],
    year: { value: '2018', label: '2018' },
    yearOptions: [
      { value: '2018', label: '2018' },
      { value: '2017', label: '2017' },
      { value: '2016', label: '2016' }
    ],
    month: { value: '7', label: 'Julio' },
    monthOptions: [
      { value: '7', label: 'Julio' },
      { value: '6', label: 'Junio' },
      { value: '5', label: 'Mayo' }
    ],
    startDate: new Date(),
    tableHead: ['Horario', 'Carnes', 'Fiambrería y Quesos', 'Pescados y Maríscos'],
    departments_info: [
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
    const { department, departmentOptions, year, yearOptions, month, monthOptions, startDate, tableHead, departments_info } = this.state;

    return (
      <React.Fragment>
        {this.state.loading && <p>Loading...</p>}
        <div className="col-12 mb-2">
          <div className="card dashboard__filter">
            <form onSubmit={this.handleSubmit}>
              <div className="form-group">
                <DayPickerInput
                  dayPickerProps={{locale: 'es', localeUtils: MomentLocaleUtils}}
                  format="DD-MM-YYYY"
                  formatDate={formatDate}
                  parseDate={parseDate}
                  placeholder="DD-MM-AAAA"
                  locale="es"
                />
              </div>
              <button className="btn btn-primary" type="submit">Buscar</button>
            </form>
          </div>
        </div>
        <div className="col-md-12 mb-2">
          <div className="card dashboard__table">
            <div className="table-responsive">
              <h5 className="card-title">Dotación</h5>
              <table className="table">
                <thead>
                  <tr>
                    {tableHead.map((th, index) => (
                      <th className="text-center" key={index} width={ 100 / tableHead.length + "%" }>{th}</th>
                    ))}
                  </tr>
                </thead>
                <tbody>
                  {departments_info.map(department => (
                    <tr key={department.id}>
                      <td className="shifts text-secondary text-center" scope="row">{department.shiftName}</td>
                      <td className="text-center">{department.department_1}</td>
                      <td className="text-center">{department.department_2}</td>
                      <td className="text-center">{department.department_3}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default ProductionTable
