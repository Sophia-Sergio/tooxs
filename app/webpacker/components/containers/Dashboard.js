import React, { Component } from 'react';
import axios from 'axios';
import { getPeriod } from '../lib/helpers';
import {
  createFiltersData1 as createFiltersData,
  worldChange,
  getDepartments,
  getBiggerDepartment,
  getMonths,
  yearChange,
  departmentChange,
  monthChange
} from '../lib/filters';
import Loader from '../components/UI/Loader';
import Select from 'react-select';
import Period from '../components/Period';
import { Line } from 'react-chartjs-2';
import { merge } from 'lodash';
import Stats from '../components/Stats';
import ShiftPlan from '../components/dashboard/ShiftPlan';
import EmployeesTable from '../components/dashboard/EmployeesTable';
import Chart from '../components/Chart';

export default class Dashboard extends Component {
  state = {
    loading: true,
    store: {},
    world: {},
    worldOptions: [],
    department: {},
    year: {},
    yearOptions: [],
    month: {},
    monthOptions: [],
    stats: {},
    period: '',
    summaryTables: null,
    chartSummary: null,
    chartData: null,
    salesAssistants : {},
    sellers: {}
  };

  componentWillMount() {
    createFiltersData(this);
  }

  componentDidMount() {
    this.getComponentData();
  }

  getChartData(parameters) {
    axios
      .get(`${this.props.root_url}/api/v1/statistics/chart?${parameters}`)
      .then(response => {
        this.setState({
          chartData: response.data
        });
        this.getEmployeesData(parameters);
      })
      .catch(error => {
        console.log(error);
      });
  }

  getStatsData(parameters) {
    axios
      .get(`${this.props.root_url}/api/v1/statistics/summary?${parameters}`)
      .then(response => {
        this.setState({
          chartSummary: response.data
        });
        this.getChartData(parameters);
      })
      .catch(error => {
        console.log(error);
      });
  }

  getEmployeesData(parameters) {
    axios
      .get(`${this.props.root_url}/api/v1/employees/table?${parameters}`)
      .then(response => {
        this.setState({
          salesAssistants: response.data.sales_assistants
            ? response.data.sales_assistants
            : [],
          sellers: response.data.sellers ? response.data.sellers : []
        });
        getPeriod(this);
      })
      .catch(error => {
        console.log(error);
      });
  }

  getComponentData = () => {
    this.setState({ loading: true });
    let parameters = `type=efficiency&store=${
      this.state.store.value
    }&department=${this.state.department.value}&year_start=${
      this.state.year.value
    }&month_start=${this.state.month.value}`;
    this.getStatsData(parameters);
  };

  handleSubmit = (e, month) => {
    e.preventDefault();
    this.getComponentData();
  };

  render() {
    const {
      world,
      store,
      storesOptions,
      department,
      departmentOptions,
      worldOptions,
      year,
      yearOptions,
      month,
      monthOptions,
      salesAssistants,
      sellers,
      period,
      chartSummary,
      chartData
    } = this.state;

    return (
      <React.Fragment>
        {this.state.loading && <Loader />}
        <div className="col-12 mb-2">
          <div className="card dashboard__filter">
            <form onSubmit={this.handleSubmit}>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={node => worldChange(node, this)}
                  options={worldOptions}
                  placeholder={`World`}
                  value={world}
                />
              </div>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={node => departmentChange(node, this)}
                  options={departmentOptions}
                  placeholder={`Departamento`}
                  value={department}
                />
              </div>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={node => yearChange(node, this)}
                  options={yearOptions}
                  placeholder={`Año`}
                  value={year}
                />
              </div>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={node => monthChange(node, this)}
                  options={monthOptions}
                  placeholder={`Mes`}
                  value={month}
                />
              </div>
              <button className="btn btn-primary" type="submit">
                Buscar
              </button>
            </form>
          </div>
        </div>
        <Period period={period} />
        <div className="col-12 mb-2">
          <div className="card dashboard__chart">
            {chartSummary && <Stats chartSummary={chartSummary} />}
            <h5 className="secondary-title">Gráfico de eficiencia</h5>
            {chartData && (
              <Chart background currency={false} chartData={chartData} />
            )}
          </div>
        </div>
        <ShiftPlan />
        <EmployeesTable sales_assistants={salesAssistants} sellers={sellers} />
      </React.Fragment>
    );
  }
}
