import React, { Component } from 'react';
import { currencyFormat } from '../lib/helpers';
import Schedule from '../components/sellers/Schedule';
import DaysOff from '../components/sellers/DaysOff';
import MonthSales from '../components/sellers/MonthSales';
import MyAvailableShifts from '../components/sellers/MyAvailableShifts';
import userDefault from '../../images/user_default';

export default class Employee extends Component {
  state = {
    loading: true,
    result: '',
    month_sales: [
      {
        week_name: 'Semana 1',
        week_dates: ["25", "26", "27","28","29","30","31"],
        week_plan: [1303868, 1307576, 1305721, 1306950, 1303748, 1307055, 1306913, ],
        week_real: [1050693, 1052064, 1052452, 1052090, 1050675, 1051218, 1052027, 7383038]
      },
      {
        week_name: 'Semana 2',
        week_dates: ["01","02", "03","04","05","06","07"],
        week_plan: [1308793, 1300146, 1303969, 1307524, 1305217, 1301770, 1300484, 9168130],
        week_real: [1051102, 1053491, 1050894, 1053125, 1052897, 1050111, 1052839, 7383038]
      },
      {
        week_name: 'Semana 3',
        week_dates: ["08","09", "10","11","12","13","14"],
        week_plan: [1306118, 1307671, 1307038, 1308898, 1304565, 1307478, 1309245, 9168130],
        week_real: [1053760, 1053264, 1050419, 1054018, 1053868, 1053433, 1051583, 7383038]
      },
      {
        week_name: 'Semana 4',
        week_dates: ["15","16", "17","18","19","20","21"],
        week_plan: [1306109, 1300747, 1304161, 1300668, 1303406, 1302336, 1309400, 9168130],
        week_real: [1052278, 1051927, 1051719, 1051743, 1054001, 1053415, 1051638, 7383038]
      },
      {
        week_name: 'Semana 5',
        week_dates: ["22","23","24","25", "26","27","28"],
        week_plan: [1308793,1300146, 1303969, 1307524, 1305217, 1301770, 1300484, 9168130],
        week_real: [1052278, 1051927, 1051719, 1051743, 1054001, 1053415, 1051638, 7383038]
      },
    ]
  }
  render () {
    const { shifts, days_off, month_sales } = this.state;
    const { employee } = this.props;
    return (
      <React.Fragment>
        <div className="col-md-12">
          <div className="card dashboard__user">
            <div className="row">
              <div className="col-md-12 mb-4">
                <div className="dashboard__user__avatar">
                  <div className="dashboard__user__avatar__image">
                    <figure>
                      <img
                        src={ employee.avatar != '' ? employee.avatar : userDefault}
                        alt={`${employee.name} ${employee.surename_1}`}
                        />
                    </figure>
                  </div>
                  <div className="dashboard__user__avatar__name">
                    <h3>
                      {`${employee.name} ${employee.surname_1}`}
                      { employee.working_today && <span>En turno</span> }
                    </h3>
                    <h4>Asistente de tienda</h4>
                  </div>
                </div>
              </div>
              <div className="col-md-6">
                <div className="dashboard__user__item">
                  <div className="dashboard__user__item__icon">
                    <i className="fa fa-building-o"></i>
                  </div>
                  <p>
                    Turno asignado: <strong>{employee.work_shift}</strong><br/>
                    Tienda: <strong>{employee.store}</strong><br/>
                    Departamento: <strong>{employee.department}</strong><br/>
                    Activo desde: <strong>Domingo 01 de Octubre 2017</strong><br/>
                    Cumplimiento: <strong>${ currencyFormat(parseInt(employee.achievements)) }</strong>
                  </p>
                </div>
              </div>
              <div className="col-md-6">
                <div className="dashboard__user__item">
                  <div className="dashboard__user__item__icon">
                    <i className="fa fa-id-card-o"></i>
                  </div>
                  <p>
                    Dirección: <strong>{employee.address}</strong><br/>
                    Comuna: <strong>{employee.commune}</strong><br/>
                    Ciudad: <strong>{employee.city}</strong><br/>
                    Teléfono: <strong>{employee.phone}</strong><br/>
                    E-mail: <strong>{employee.email}</strong>
                  </p>
                </div>
              </div>
              <div className="col-md-12 mt-4 dashboard__user__tabs">
                <ul className="nav nav-tabs nav-fill" id="myTab" role="tablist">
                  <li className="nav-item">
                    <a className="nav-link active" id="home-tab" data-toggle="tab" href="#shifts" role="tab" aria-controls="shifts" aria-selected="true">Mis turnos</a>
                  </li>
                  <li className="nav-item">
                    <a className="nav-link" id="contact-tab" data-toggle="tab" href="#sells" role="tab" aria-controls="sells" aria-selected="false">Ventas por mes</a>
                  </li>
                  <li className="nav-item">
                    <a className="nav-link" id="contact-tab" data-toggle="tab" href="#available-shifts" role="tab" aria-controls="available-shifts" aria-selected="false">Disponibilidad de turno</a>
                  </li>
                </ul>
                <div className="tab-content">
                  <Schedule
                    root_url={this.props.root_url}
                    shifts={shifts}
                    employee={this.props.employee}
                  />
                  <MonthSales
                    root_url={this.props.root_url}
                    month_sales={month_sales}
                    employee={this.props.employee}
                  />
                  <div className="tab-pane fade" id="available-shifts" role="tabpanel" aria-labelledby="available-shifts-tab">
                    <div className="tab-pane__content">
                      <MyAvailableShifts />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}
