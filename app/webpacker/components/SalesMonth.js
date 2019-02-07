import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat, monthFormat, dayMonthFormat } from './helpers';
import { currencyFormat, monthFormat } from './helpers';
import Loader from "./layout/Loader";
import Select from 'react-select';
import MonthPicker from './shared/MonthPicker';
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
      store: {},
      storeOptions: [],
      comparedStoreFilter: false,
      comparedStore: {},
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
      chartData: {},
      chartOptions: {
        tooltips: {
          mode: 'point'
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
  }

  createFiltersData(){
    var filters = this.props.filters;
    var world = { value: filters.world_selected.id, label: filters.world_selected.name };
    var departments = this.getDepartments(filters.worlds_departments, world);
    var department = this.getBiggerDepartment(filters.worlds_departments, world);
    var year = new Date().getFullYear();
    var month = new Date().getMonth();
    var monthAgo = currentDate.setMonth(month - 1);
    this.setState({
      world: world,
      worldOptions: filters.worlds_departments.map( world => ({ value: world.id, label: world.name })),
      store: { value: filters.store.id, label: filters.store.name },
      department: { value: department.id, label: department.name },
      departmentOptions: departments.map( store => ({ value: store.id, label: store.name }) ),
      yearFrom: year,
      monthFrom: 1,
      yearTo: year,
      monthTo: 2,
    })
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
        console.log(resultText);
        this.setState({
          chartData: res.data.chart,
          chartTitle: 'Gráfico de ventas',
          datesBetween: resultText,
          summary: res.data.summary,
          loading: false
        });
        this.setState({
          chartData: {
            ...this.state.chartData,
            labels: this.state.chartData.labels.map( label => ( dayMonthFormat(label) ) )
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

  getComparativeChartData(){
    this.setState({loading: true});
    var parameters = `type=sales&store=${this.state.store.value}&department=${this.state.department.value}&year_start=${this.state.yearFrom}&month_start=${this.state.monthFrom}&year_end=${this.state.yearTo}&month_end=${this.state.monthTo}&store_compared=20`;
    axios.get(`${this.props.root_url}/api/v1/statistics/compared_stores?${parameters}`)
      .then(res => {
        this.setState({chartData: res.data, loading: false});
        this.setState(state => {
          state.chartData.datasets[0].backgroundColor = 'rgba(71, 196, 254, .2)';
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
          return state
        })
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
    console.log(this.state.store);
  }

  departmentChange = (department) => {
    this.setState({ department });
    console.log(this.state.department);
  }

  yearChange = (year) => {
    this.setState({ year });
    console.log(this.state.year);
  }

  monthChange = (month) => {
    this.setState({ month });
    console.log(this.state.month);
  }

  handleSubmit = (e, month) => {
    e.preventDefault();
    this.setState({ comparedStoreFilter: false });
    this.getChartData();
  }

  handleCompareSubmit = (e, month) => {
    e.preventDefault();
    this.getComparativeChartData()
  }

  // Departamento, Año, Mes

  handleCompareSubmit = (e, month) => {
    e.preventDefault();
    this.getComparativeChartData()
  }

  render() {
    const {
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
                <MonthPickerInput
                  inputProps={{id: 'MonthPickerInput'}}
                  year={yearFrom}
                  month={monthFrom - 1}
                  placeholder={'Fecha desde'}
                  onChange={(maskedValue, selectedYear, selectedMonth) => {
                    console.log(selectedYear, selectedMonth);
                    this.setState({yearFrom: selectedYear, monthFrom: selectedMonth});
                  }}
                  closeOnSelect={true}
                  lang={'es'}
                />
              </div>
              <div className="form-group">
                <MonthPickerInput
                  inputProps={{id: 'MonthPickerInput'}}
                  year={yearTo}
                  month={monthTo - 1}
                  onChange={(maskedValue, selectedYear, selectedMonth) => {
                    console.log(selectedYear, selectedMonth);
                    this.setState({yearTo: selectedYear, monthTo: selectedMonth});
                  }}
                  closeOnSelect={true}
                  lang={'es'}
                />
              </div>
              <button
                className="btn btn-light"
                type="button"
                data-toggle="collapse"
                data-target="#collapseExample"
                aria-expanded="false"
                aria-controls="collapseExample"
                style={{padding: 0}}
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
          <div className="collapse" id="collapseExample">
            <div className="card dashboard__filter mt-2">
              <form onSubmit={this.handleCompareSubmit}>
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
                <button className="btn btn-primary" type="submit">
                  Comparar tiendas
                </button>
              </form>
            </div>
          </div>
        </div>
        <div className="modal fade slide-right" id="modalFillIn" tabindex="-1" role="dialog" aria-hidden="true">
          <button type="button" className="close" data-dismiss="modal" aria-hidden="true">
            <i className="pg-close"></i>
          </button>
          <div className="modal-dialog ">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="text-left p-b-5"><span className="semi-bold">Seleccione Tienda para Comparación</span></h5>
              </div>
              <div className="modal-body">
                <div className="row">
                  <div className="col-12 ">
                    <div className="form-group">
                      <Select
                        noOptionsMessage={() => 'No se econtraron más opciones'}
                        onChange={this.departmentChange}
                        options={departmentOptions}
                        placeholder={`Departamento`}
                        value={department}
                      />
                    </div>
                  </div>
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
        <div className="col-12 mb-2">
          <div className="card dashboard__chart">
            <h5 className="card-title">Gráfico de ventas</h5>
            <p className="card-text">{`Datos desde el 30 de ${monthFormat(monthFrom)} al 27 de ${monthFormat(monthTo)} de 2018`}</p>
          </div>
        </div>
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
        { this.state.summary &&
          <MonthTable {...summary} />
        }
      </React.Fragment>
    );
  }
}

export default SalesMonth;
