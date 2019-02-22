import React, { Component } from 'react';
import { currencyFormat } from './helpers';
import Schedule from './sellers/Schedule';
import DaysOff from './sellers/DaysOff';
import MonthSales from './sellers/MonthSales';
import MyAvailableShifts from './sellers/MyAvailableShifts';
import userDefault from '../images/user_default';

class EmployeesShow extends Component {
  state = {
    loading: true,
    result: '',
    employee: {
      id: 5,
      name: 'Jorge',
      last_name: 'Marroquín Suarez',
      avatar: '',
      rut: '12.222.008-7',
      store: 'Alto Las Condes',
      department: 'Juvenil mujer',
      position: 'Vendedor tienda',
      shift: 'Turno 1 de 45 horas',
      sell: 55503480,
      goal: 153000000.0,
      objective: 0.36,
      link: '/sellers/5',
      phone: '+56 9 9999 9999',
      address: 'El Vergel 323',
      municipe: 'Providencia',
      city: 'Santiago de Chile',
      email: 'demo@tooxs.com'
    },
    month_sales: [
      {
        week_name: 'Semana 1',
        week_dates: ["27","28","29","30","31","01","02"],
        week_plan: [0,0,0,0,0,0,0],
        week_real: [0,0,0,0,0,0,0],
      },
      {
        week_name: 'Semana 2',
        week_dates: ["03","04","05","06","07","08","09"],
        week_plan: [0,0,0,0,0,0,0],
        week_real: [0,0,0,0,0,0,0],
      },
      {
        week_name: 'Semana 3',
        week_dates: ["10","11","12","13","14","15","16"],
        week_plan: [0,0,0,0,0,0,0],
        week_real: [0,0,0,0,0,0,0],
      },
      {
        week_name: 'Semana 4',
        week_dates: ["17","18","19","20","21","22","23"],
        week_plan: [0,0,0,0,0,0,0],
        week_real: [0,0,0,0,0,0,0],
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
                    <h4>Sales assistant</h4>
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
                  <div className="tab-pane fade" id="sells" role="tabpanel" aria-labelledby="sells-tab">
                    <div className="tab-pane__content">
                      <MonthSales month_sales={month_sales} />
                    </div>
                  </div>
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

export default EmployeesShow;
