import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat, monthFormat, dayMonthFormat } from './helpers';
import Loader from "./layout/Loader";
import Select from 'react-select';
import Period from './shared/Period';
import MonthPicker from './shared/MonthPicker';
import MonthRangePicker from 'react-monthrange-picker';
import moment from 'moment';
import {Line} from 'react-chartjs-2';
import MonthTable from './sales/MonthTable';

class SalesMonth extends Component {
  constructor(props){
    super(props);
    this.state = {
      loading: false,
      alert: false,
      chartTitle: 'Gráfico de ventas',
      datesBetween: '',
      isCompared: false,
      store: {},
      storeOptions: [],
      comparedStoreFilter: false,
      comparedStore: [],
      comparedStoreOptions: [],
      department: {},
      departmentOptions: [],
      yearFrom: null,
      monthFrom: null,
      selectedYearFrom: null,
      selectedMonthFrom: null,
      yearTo: null,
      monthTo: null,
      selectedYearTo: null,
      selectedMonthTo: null,
      period: {},
      chartData: {},
      chartOptions: {
        tooltips: {
          mode: 'point',
          callbacks: {
            label: function(tooltipItem, data) {
              var label = data.datasets[tooltipItem.datasetIndex].label || '';
              if (label) {
                label += ': ';
              }
              label += Math.round(tooltipItem.yLabel * 100) / 100;
              return label;
            },
          },
        },
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: false,
              // stepSize: 500000,
             	userCallback: function(value, index, values) {
                return '$' + currencyFormat(value).toString();
              }
            }
          }]
        },
        maintainAspectRatio: false,
        responsive: true,
      },
      summary: null,
    }
  }

  componentWillMount = () => {
    this.createFiltersData();
  }

  componentDidMount = () => {
    this.getChartData();
    this.getPeriod();
  }

  createFiltersData(){
    var filters = this.props.filters;
    var world = { value: filters.world_selected.id, label: filters.world_selected.name };
    var departments = this.getDepartments(filters.worlds_departments, world);
    var department = this.getBiggerDepartment(filters.worlds_departments, world);
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
      worldOptions: filters.worlds_departments.map( world => ({ value: world.id, label: world.name })),
      store: { value: filters.store.id, label: filters.store.name },
      department: { value: department.id, label: department.name },
      departmentOptions: departments.map( store => ({ value: store.id, label: store.name }) ),
      yearFrom: firstYearValue,
      monthFrom: firstMonthValue,
      yearTo: lastYearValue,
      monthTo: lastMonthValue,
      selectedYearFrom: filters.year.value,
      selectedMonthFrom: filters.month.value,
      selectedYearTo: filters.year.value,
      selectedMonthTo: filters.month.value
    })
  }

  getPeriod = () => {
    var parameters = `year_start=${this.state.selectedYearFrom}&month_start=${this.state.selectedMonthFrom}`;
    axios.get(`${this.props.root_url}/api/v1/periods/filter_period?${parameters}`)
      .then(res => {
        this.setState({ period: res.data });
      })
      .catch(error => {
        console.log(error);
      });
  }

  getChartData(){
    this.setState({loading: true});
    let parameters = `type=sales&store=${this.state.store.value}&department=${this.state.department.value}&year_start=${this.state.selectedYearFrom}&month_start=${this.state.selectedMonthFrom}&year_end=${this.state.selectedYearTo}&month_end=${this.state.selectedMonthTo}`;
    axios.get(`${this.props.root_url}/api/v1/statistics/chart?${parameters}`)
      .then(res => {
        const { selectedMonthFrom, selectedYearFrom, selectedMonthTo, selectedYearTo } = this.state;
        let resultText = selectedYearFrom === selectedYearTo &&  selectedMonthFrom === selectedMonthTo ?
            `Datos correspondientes al mes de ${monthFormat(selectedMonthFrom)} de ${selectedYearFrom}` :
            `Datos desde ${monthFormat(selectedMonthFrom)} de ${selectedYearFrom} hasta ${monthFormat(selectedMonthTo)} de ${selectedYearTo}`;
        this.setState({
          isCompared: false,
          chartData: res.data.chart,
          chartTitle: 'Gráfico de ventas',
          datesBetween: resultText,
          summary: res.data.summary,
          loading: false
        });
        this.setState({
          chartData: {
            ...this.state.chartData,
            labels: this.state.chartData.labels.map( label => ( dayMonthFormat(label) ) ),
          }
        });
        this.setState(state => {
          state.chartData.datasets[0].backgroundColor = 'rgba(71, 196, 254, 0)';
          state.chartData.datasets[0].borderColor = 'rgba(71, 196, 254, 1)';
          state.chartData.datasets[0].borderWidth = 2;
          state.chartData.datasets[0].pointBackgroundColor = 'rgba(255, 255, 255, 1)';
          state.chartData.datasets[0].pointBorderWidth = 2;
          state.chartData.datasets[0].pointRadius = 5;
          state.chartData.datasets[1].backgroundColor = 'rgba(255, 255, 255, 0)';
          state.chartData.datasets[1].borderColor = 'rgba(137, 218, 89, 1)';
          state.chartData.datasets[1].borderWidth = 2;
          state.chartData.datasets[1].pointBackgroundColor = 'rgba(255, 255, 255, 1)';
          state.chartData.datasets[1].pointBorderWidth = 2;
          state.chartData.datasets[1].pointRadius = 5;
          state.chartData.datasets[2].backgroundColor = 'rgba(255, 255, 255, 0)';
          state.chartData.datasets[2].borderColor = 'rgba(227, 58, 62, 1)';
          state.chartData.datasets[2].borderWidth = 2;
          state.chartData.datasets[2].pointBackgroundColor = 'rgba(255, 255, 255, 1)';
          state.chartData.datasets[2].pointBorderWidth = 2;
          state.chartData.datasets[2].pointRadius = 5;
          return state
        })
      })
      .catch(error => {
        console.log(error);
        this.setState({
          loading: false,
          errors: {
            datesBetween: 'No se econtraron coincidencias.'
          }
        })
      });
  }

  getComparedStores(e){
    e.preventDefault();
    this.setState({
      comparedStoreFilter: false,
      comparedStore: {},
      comparedStoreOptions: [],
      alert: false
    });
    var parameters = `store=${this.state.store.value}&department=${this.state.department.value}`;
    axios.get(`${this.props.root_url}/api/v1/filters/compared_stores?${parameters}`)
      .then(res => {
        let stores = res.data.stores;
        if(stores.length > 0){
          this.setState({
            comparedStoreOptions: stores.map( store => ({ value: store.id, label: store.name }) ),
            comparedStore: stores.map( store => ({ value: store.id, label: store.name }) ).slice(0,1),
            comparedStoreFilter: true
          });
        } else {
          this.setState({
            comparedStoreFilter: false,
            comparedStore: {},
            comparedStoreOptions: [],
            alert: true,
          });
        }
      })
      .catch(error => {
        this.setState({
          comparedStoreFilter: false,
          alert: true
        });
        console.log(error);
      });
  }

  getComparativeChartData(){
    this.setState({loading: true});
    var comparedStores = this.state.comparedStore.map( store => ( '&compared_stores[]=' + store.value )).join('');
    console.log(comparedStores);
    const parameters = `type=sales&store=${this.state.store.value}&department=${this.state.department.value}&year_start=${this.state.selectedYearFrom}&month_start=${this.state.selectedMonthFrom}&year_end=${this.state.selectedYearTo}&month_end=${this.state.selectedMonthTo}${comparedStores}`;
    axios.get(`${this.props.root_url}/api/v1/statistics/compared_sales?${parameters}`)
      .then(res => {
        const defaultStyles = {
          backgroundColor : 'rgba(71, 196, 254, 0)',
          borderWidth : 2,
          pointBackgroundColor : 'rgba(255, 255, 255, 1)',
          pointBorderWidth : 2,
          pointRadius : 5,
        }
        const mainBorder = {
          borderColor: 'rgba(71, 196, 254, 1)',
        }
        const defaultBorder = () => {
          return {borderColor: 'rgba(' + (Math.floor(Math.random() * 256)) + ',' + (Math.floor(Math.random() * 256)) + ',' + (Math.floor(Math.random() * 256)) + ', 1)',};
        }
        const chart = res.data.chart.datasets.map( (data, index) => ( Object.assign({}, data, defaultStyles, index === 0 ? mainBorder : defaultBorder()) ));
        this.setState({
          isCompared: true,
          chartTitle: 'Gráfico comparativo de ventas',
          chartData: res.data.chart,
          chartData: {
            datasets: chart,
            labels: res.data.chart.labels.map( label => ( dayMonthFormat(label) ) )
          },
          summary: res.data.summary,
          loading: false
        });
      })
      .catch(error => {
        console.log(error);
        this.setState({
          loading: false,
          errors: {
            result: 'No se econtraron coincidencias.'
          }
        })
      });
  }

  getDepartments(worlds, world){
    for (var w of worlds) {
      if (w['id']==world['value']){
        return w['departments']
      }
    }
  }

  getBiggerDepartment(worlds, world){
    for (var w of worlds) {
      if (w['id']==world['value']){
        return w['bigger_department']
      }
    }
  }

  worldChange = (world) => {
    var departmentOptions = this.getDepartments(this.props.filters.worlds_departments, world)
    var department = this.getBiggerDepartment(this.props.filters.worlds_departments, world)
    this.setState({
      world: world,
      departmentOptions: departmentOptions.map( store => ({ value: store.id, label: store.name }) ),
      department: {value: department.id, label: department.name}
    });
  }

  storeChange = (department) => {
    this.setState({ store });
  }

  departmentChange = (department) => {
    this.setState({ department });
  }

  onDateFromChange = (year, month) => {
    let newMonth = month + 1;
    this.setState({selectedYearFrom: year, selectedMonthFrom: newMonth});
  }

  onDateToChange = (year, month) => {
    let newMonth = month + 1;
    this.setState({selectedYearTo: year, selectedMonthTo: newMonth});
  }

  handleSubmit = (e, month) => {
    e.preventDefault();
    this.setState({ comparedStoreFilter: false });
    this.getChartData();
  }

  comparedStoreChange = (comparedStore) => {
    this.setState({ comparedStore });
  }

  handleCompareSubmit = (e, month) => {
    e.preventDefault();
    this.getComparativeChartData()
  }

  render() {
    const {
      chartTitle,
      datesBetween,
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
      summary } = this.state;

    return (
      <React.Fragment>
        {this.state.loading && <Loader/>}
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
                  minMonth={monthFrom}
                  maxYear={selectedYearTo}
                  maxMonth={selectedMonthTo}
                  onChange={this.onDateFromChange.bind(this)}
                />
              </div>
              <div className="form-group">
                <MonthPicker
                  minYear={selectedYearFrom}
                  minMonth={selectedMonthFrom}
                  maxYear={yearTo}
                  maxMonth={monthTo}
                  onChange={this.onDateToChange.bind(this)}
                />
              </div>
              <button
                className="btn btn-light"
                type="button"
                style={{padding: 0}}
                onClick={this.getComparedStores.bind(this)}
              >
                <span
                  data-toggle="tooltip"
                  data-placement="top"
                  title="Comparar con otra tienda"
                >
                  <i className="fa fa-exchange"></i>
                </span>
              </button>
              <button className="btn btn-primary" type="submit">
                Buscar
              </button>
            </form>
          </div>
          { this.state.comparedStoreFilter &&
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
          }
        </div>
        { this.state.alert &&
          <div className="col-12 mb-2">
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
              <strong>Lo sentimos!</strong> No se encontraron tiendas con los mismos departamentos.
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
          </div>
        }
        { false &&
          <Period { ...period } />
        }
        <div className="col-12 mb-2">
          <div className="card dashboard__chart">
            <div className="dashboard__chart__canvas">
              <Line
                data={this.state.chartData}
                options={this.state.chartOptions}
              />
            </div>
          </div>
        </div>
        { summary &&
          <MonthTable {...summary} isCompared={isCompared} />
        }
      </React.Fragment>
    );
  }
}

export default SalesMonth;
