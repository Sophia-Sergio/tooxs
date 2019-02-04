import React, { Component } from "react";
import PropTypes from "prop-types";
import axios from 'axios';
import update from 'immutability-helper'; // ES6
import { currencyFormat } from "./helpers";
import Select from 'react-select';
import MonthPlan from './change_plan/MonthPlan'

class ChangePlan extends Component {
  constructor(props) {
    super(props);
    this.state = {
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
      year: 2018,
      months: [
        {
          id: 1,
          name: 'Junio',
          weeks: [
            {
              id: 1,
              name: 'Semana 1',
              plan: 47770108,
              percentage: 0,
              amount: 0,
              adjusted: 47770108
            },
            {
              id: 2,
              name: 'Semana 2',
              plan: 47770108,
              percentage: 0,
              amount: 0,
              adjusted: 47770108
            },
            {
              id: 3,
              name: 'Semana 3',
              plan: 47770108,
              percentage: 0,
              amount: 0,
              adjusted: 47770108
            },
            {
              id: 4,
              name: 'Semana 4',
              plan: 47770108,
              percentage: 0,
              amount: 0,
              adjusted: 47770108
            },
          ],
          total: 191080432,
          total_adjusted: 191080432,
        },
      ],
    }
  }

  changePercetage = (monthIndex, weekIndex) => (e) => {
    this.setState({
      months: update(this.state.months, {
        [monthIndex]: {
          weeks: {
            [weekIndex]: {
              [e.target.name]: {$set: isNaN(parseInt(e.target.value)) ? 0 : parseInt(e.target.value)},
              amount: {$set: 0},
              adjusted: {$set: parseInt(( ( e.target.value / 100 ) * 47770108 + 47770108 ).toFixed(0))}
            }
          },
          total_adjusted: {$set: this.state.months[monthIndex].weeks.reduce((prev, cur) => { return prev + cur.adjusted; }, 0)}
        }
      })
    });
  };

  changeAmount = (monthIndex, weekIndex) => (e) => {
    const key = e.target.name;
    const value = parseInt(e.target.value);
    this.setState({
      months: update(this.state.months, {
        [monthIndex]: {
          weeks: {
            [weekIndex]: {
              [e.target.name]: {$set: isNaN(parseInt(e.target.value)) ? 0 : parseInt(e.target.value)},
              percentage: {$set: 0},
              adjusted: {$set: 47770108 + parseInt(e.target.value) }
            }
          },
          total_adjusted: {$set: this.state.months[monthIndex].weeks.reduce((prev, cur) => { return prev + cur.adjusted; }, 0)}
        }
      })
    });
  };

  handleSubmit = (e, month) => {
    e.preventDefault();
    axios.get(`${this.props.root_url}/api/v1/statistics/chart?type=efficiency&store=13&department=${this.state.department.value}&year_start=2018&month_start=${this.state.month.value}`)
      .then(res => {
        //this.setState({chartData: res.data, loading: false})
        console.log(res);
    })
  }

  render () {
    const { departmentOptions, department, yearOptions, year, months, monthOptions, month } = this.state;
    return (
      <React.Fragment>
        <div className="col-12 mb-2">
          <div className="card dashboard__filter">
            <form onSubmit={this.handleSubmit}>
              <div className="form-group">
                <Select
                  options={departmentOptions}
                  placeholder={`Departamento`}
                  onChange={this.departmentChange}
                  value={department}
                />
              </div>
              <div className="form-group">
                <Select
                  options={yearOptions}
                  placeholder={`Año`}
                  onChange={this.yearChange}
                  value={year}
                />
              </div>
              <div className="form-group">
                <Select
                  options={monthOptions}
                  placeholder={`Mes`}
                  onChange={this.monthChange}
                  value={month}
                />
              </div>
              <button className="btn btn-primary" type="submit">Buscar</button>
            </form>
          </div>
        </div>
        <div className="col-12 mb-2">
          {months.map((month, index) => (
            <MonthPlan
              key={index}
              monthIndex={index}
              monthname={month.name}
              weeks={month.weeks}
              total={month.total}
              total_adjusted={month.total_adjusted}
              changePercetage={this.changePercetage}
              changeAmount={this.changeAmount}
            />
          ))}
        </div>
      </React.Fragment>
    );
  }

}

export default ChangePlan
