import React, { Component } from 'react';
import { currencyFormat } from './helpers';
import Seller from './sellers/Seller';
import Objective from './sellers/Objective';
import Distance from './sellers/Distance';
import Schedule from './sellers/Schedule';
import DaysOff from './sellers/DaysOff';
import MonthSales from './sellers/MonthSales';
import MyAvailableShifts from './sellers/MyAvailableShifts';
import userDefault from '../images/user_default';

class EmployeesShow extends Component {
  state = {
    loading: true,
    result: '',
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
          <div className="row dashboard__user-main-items">
            <Seller employee={ employee } />
            <Objective employee={ employee } />
            <Distance employee={ employee } />
          </div>
        </div>
        <div className="col-md-12">
          <div className="card dashboard__user">
            <div className="row">
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

export default EmployeesShow;
