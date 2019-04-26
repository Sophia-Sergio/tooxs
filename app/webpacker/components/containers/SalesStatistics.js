import React, { Component } from 'react';
import axios from 'axios';
import {
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
import MonthPicker from '../components/MonthPicker';
import SalesSummary from '../components/SalesSummary';
import Chart from '../components/Chart';

export default class SalesStatistics extends Component {
  state = {
    loading: false,
    alert: false,
    period: '',
    isCompared: false,
    comparedStoreFilter: false,
    yearFrom: null,
    monthFrom: null,
    selectedYearFrom: null,
    selectedMonthFrom: null,
    yearTo: null,
    monthTo: null,
    selectedYearTo: null,
    selectedMonthTo: null,
    chartData: {},
    summary: null
  };

  componentWillMount = () => {
    this.createFiltersData();
  };

  componentDidMount = () => {
    this.getChartData();
  };

  createFiltersData = () => {
    var filters = this.props.filters;
    var world = {
      value: filters.world_selected.id,
      label: filters.world_selected.name
    };
    var departments = getDepartments(filters.worlds_departments, world);
    var department = getBiggerDepartment(filters.worlds_departments, world);
    var lastYear = filters.years.slice(-1)[0];
    var firstYear = filters.years.slice(0)[0];
    var lastYearValue = lastYear.value;
    var firstYearValue = firstYear.value;
    var lastMonth = lastYear.months.slice(-1)[0];
    var firstMonth = lastYear.months.slice(0)[0];
    var lastMonthValue = lastMonth.value;
    var firstMonthValue = firstMonth.value;
    this.setState({
      world: world,
      worldOptions: filters.worlds_departments.map(world => ({
        value: world.id,
        label: world.name
      })),
      store: { value: filters.store.id, label: filters.store.name },
      department: { value: department.id, label: department.name },
      departmentOptions: departments.map(store => ({
        value: store.id,
        label: store.name
      })),
      yearFrom: firstYearValue,
      monthFrom: firstMonthValue,
      yearTo: lastYearValue,
      monthTo: lastMonthValue,
      selectedYearFrom: filters.year.value,
      selectedMonthFrom: filters.month.value,
      selectedYearTo: filters.year.value,
      selectedMonthTo: filters.month.value
    });
  };

  getChartData = () => {
    this.setState({ loading: true });
    let parameters = `type=sales&store=${this.state.store.value}&department=${
      this.state.department.value
    }&year_start=${this.state.selectedYearFrom}&month_start=${
      this.state.selectedMonthFrom
    }&year_end=${this.state.selectedYearTo}&month_end=${
      this.state.selectedMonthTo
    }`;
    axios
      .get(`${this.props.root_url}/api/v1/statistics/chart?${parameters}`)
      .then(res => {
        this.setState({
          isCompared: false,
          summary: res.data.summary,
          loading: false,
          chartData: {
            ...res.data.chart,
            labels: res.data.chart.labels
          }
        });
      })
      .catch(error => {
        this.setState({
          loading: false
        });
      });
  };

  getComparedStores = e => {
    e.preventDefault();
    this.setState({
      loading: true,
      comparedStoreFilter: false,
      comparedStore: {},
      comparedStoreOptions: [],
      alert: false
    });
    var parameters = `store=${this.state.store.value}&department=${
      this.state.department.value
    }`;
    axios
      .get(
        `${this.props.root_url}/api/v1/filters/compared_stores?${parameters}`
      )
      .then(res => {
        let stores = res.data.stores;
        if (stores.length > 0) {
          this.setState({
            comparedStoreOptions: stores.map(store => ({
              value: store.id,
              label: store.name
            })),
            comparedStore: stores.map(store => ({
              value: store.id,
              label: store.name
            })),
            comparedStoreFilter: true,
            loading: false
          });
        } else {
          this.setState({
            comparedStoreFilter: false,
            comparedStore: {},
            comparedStoreOptions: [],
            alert: true,
            loading: false
          });
        }
      })
      .catch(error => {
        this.setState({
          comparedStoreFilter: false,
          alert: true,
          loading: false
        });
      });
  };

  getComparativeChartData() {
    this.setState({ loading: true });
    var comparedStores = this.state.comparedStore
      .map(store => '&compared_stores[]=' + store.value)
      .join('');
    const parameters = `type=sales&store=${this.state.store.value}&department=${
      this.state.department.value
    }&year_start=${this.state.selectedYearFrom}&month_start=${
      this.state.selectedMonthFrom
    }&year_end=${this.state.selectedYearTo}&month_end=${
      this.state.selectedMonthTo
    }${comparedStores}`;
    axios
      .get(
        `${this.props.root_url}/api/v1/statistics/compared_sales?${parameters}`
      )
      .then(res => {
        const mainStore = res.data.chart.datasets.slice(0, 1);
        const compStores = res.data.chart.datasets.slice(1).sort((a, b) => {
          return a.label < b.label ? -1 : 1;
          return 0;
        });
        const mergedStores = mainStore.concat(compStores);
        const tableMainStore = res.data.summary.datasets.slice(0, 1);
        const tableCompStores = res.data.summary.datasets
          .slice(1)
          .sort((a, b) => {
            return a.label < b.label ? -1 : 1;
            return 0;
          });
        const tableMergedStores = tableMainStore.concat(tableCompStores);
        this.setState({
          isCompared: true,
          chartData: {
            datasets: mergedStores.map(data => Object.assign({}, data)),
            labels: res.data.chart.labels
          },
          summary: {
            datasets: tableMergedStores,
            title: res.data.summary.title
          },
          loading: false
        });
        const table = document.querySelector('.table-responsive');
        const tableWidth = table.offsetWidth;
        table.scrollLeft += tableWidth;
      })
      .catch(error => {
        this.setState({
          loading: false,
          errors: {
            result: 'No se econtraron coincidencias.'
          }
        });
      });
  }

  onDateFromChange = (selectedYearFrom, month) => {
    this.setState({ selectedYearFrom, selectedMonthFrom: month + 1 });
  }

  onDateToChange = (selectedYearTo, month) => {
    this.setState({ selectedYearTo, selectedMonthTo: month + 1 });
  }

  comparedStoreChange = comparedStore => {
    this.setState({ comparedStore });
  };

  handleSubmit = (e, month) => {
    e.preventDefault();
    this.setState({ comparedStoreFilter: false });
    this.getChartData();
  };

    handleCompareSubmit = (e, month) => {
    e.preventDefault();
    this.getComparativeChartData();
  };

  render() {
    const {
      period,
      isCompared,
      world,
      worldOptions,
      store,
      storesOptions,
      comparedStore,
      comparedStoreOptions,
      department,
      departmentOptions,
      yearFrom,
      monthFrom,
      selectedYearFrom,
      selectedMonthFrom,
      monthTo,
      yearTo,
      selectedYearTo,
      selectedMonthTo,
      summary
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
                  onChange={this.worldChange}
                  options={worldOptions}
                  placeholder={`World`}
                  value={world}
                />
              </div>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={this.departmentChange}
                  options={departmentOptions}
                  placeholder={`Departamento`}
                  value={department}
                />
              </div>
              <div className="form-group">
                <MonthPicker
                  minYear={yearFrom}
                  minMonth={monthTo}
                  maxYear={yearTo}
                  maxMonth={selectedMonthTo}
                  onChange={this.onDateFromChange.bind(this)}
                />
              </div>
              <div className="form-group">
                <MonthPicker
                  minYear={yearFrom}
                  minMonth={monthTo}
                  maxYear={yearTo}
                  maxMonth={selectedMonthTo}
                  onChange={this.onDateToChange.bind(this)}
                />
              </div>
              <button
                className="btn btn-light"
                type="button"
                style={{ padding: 0 }}
                onClick={this.getComparedStores.bind(this)}
              >
                <span
                  data-toggle="tooltip"
                  data-placement="top"
                  title="Comparar con otra tienda"
                >
                  <i className="fa fa-exchange" />
                </span>
              </button>
              <button className="btn btn-primary" type="submit">
                Buscar
              </button>
            </form>
          </div>
          {this.state.comparedStoreFilter && (
            <div className="card dashboard__filter mt-2">
              <form onSubmit={this.handleCompareSubmit}>
                <div className="form-group">
                  <Select
                    noOptionsMessage={() => 'No se econtraron más opciones'}
                    onChange={this.comparedStoreChange}
                    options={comparedStoreOptions}
                    isMulti
                    placeholder={`Compared Store`}
                    value={comparedStore}
                  />
                </div>
                <button className="btn btn-primary" type="submit">
                  Comparar tiendas
                </button>
              </form>
            </div>
          )}
        </div>
        {this.state.alert && (
          <div className="col-12 mb-2">
            <div
              class="alert alert-warning alert-dismissible fade show"
              role="alert"
            >
              <strong>Lo sentimos!</strong> No se encontraron tiendas con los
              mismos departamentos.
              <button
                type="button"
                class="close"
                data-dismiss="alert"
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          </div>
        )}
        {false && <Period period={period} />}
        <div className="col-12 mb-2">
          <Chart background={false} currency chartData={this.state.chartData} />
        </div>
        {summary && <SalesSummary {...summary} isCompared={isCompared} />}
      </React.Fragment>
    );
  }
}
