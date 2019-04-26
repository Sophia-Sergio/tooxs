import React, { Component } from 'react';
import axios from 'axios';
import { getPeriod } from '../lib/helpers';
import {
  createFiltersData1 as createFiltersData,
  getDepartments,
  getBiggerDepartment,
  getMonths,
  yearChange,
  departmentChange,
  monthChange,
  worldChange
} from '../lib/filters';
import Loader from '../components/UI/Loader';
import Select from 'react-select';
import Chart from '../components/Chart';
import { merge } from 'lodash';
import DotationTable from '../components/DotationTable';
import DotationPlan from '../components/DotationPlan';
import Period from '../components/Period';
import SummaryTable from '../components/SummaryTable';
import Stats from '../components/Stats';

export default class Optimizer extends Component {
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
    period: '',
    summaryTables: null,
    chartSummary: null,
    chartData: null
  };

  componentWillMount() {
    createFiltersData(this);
  }

  componentDidMount() {
    this.getComponentData();
  }

  getComponentData = () => {
    this.setState({ loading: true });
    axios
      .get(
        `${
          this.props.root_url
        }/api/v1/statistics/chart?type=productivity&store=${
          this.state.store.value
        }&department=${this.state.department.value}&year_start=${
          this.state.year.value
        }&month_start=${this.state.month.value}`
      )
      .then(res => {
        this.setState({
          isCompared: false,
          summary: res.data.summary,
          loading: false,
          chartData: {
            ...res.data.chart,
            labels: res.data.chart.labels
          },
          summaryTables: res.data.summary_tables,
          chartSummary: res.data.chart_summary
        });
        getPeriod(this);
      })
      .catch(error => {
        this.setState({
          loading: false
        });
      });
  };

  getEmployeesData() {
    axios
      .get(
        `${this.props.root_url}/api/v1/employees/sellers_table?store=${
          this.state.store.value
        }&department=${this.state.department.value}&year_start=${
          this.state.year.value
        }&month_start=${this.state.month.value}`
      )
      .then(res => {
        this.setState({ employees: res.data });
      })
      .catch(error => {
        console.log(error);
      });
  }

  handleSubmit = (e, month) => {
    e.preventDefault();
    this.getChartData();
  };

  render() {
    const {
      department,
      period,
      worldOptions,
      world,
      departmentOptions,
      year,
      yearOptions,
      month,
      monthOptions,
      summaryTables,
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
            {chartData && <Chart currency chartData={chartData} />}
          </div>
        </div>
        {summaryTables && (
          <React.Fragment>
            <SummaryTable
              table_title={'Plan de Ventas'}
              row_titles={summaryTables.title}
              datasets={summaryTables.datasets.sales_plan}
            />
            <SummaryTable
              table_title={'Productividad no optimizada'}
              row_titles={summaryTables.title}
              datasets={summaryTables.datasets.no_optimized}
            />
            <SummaryTable
              table_title={'Productividad optimizada'}
              row_titles={summaryTables.title}
              datasets={summaryTables.datasets.optimized}
            />
          </React.Fragment>
        )}
        <DotationTable />
        <DotationPlan />
      </React.Fragment>
    );
  }
}
