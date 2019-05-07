import React, {Component} from 'react';
import axios from 'axios';
import { getPeriod } from '../lib/helpers';
import {
  createFiltersData1 as createFiltersData,
  worldChange,
  yearChange,
  departmentChange,
  monthChange
} from '../lib/filters';
import Select from 'react-select';
import ProductivityTable from '../components/hour_analysis/ProductivityTable';
import DetailTable from '../components/hour_analysis/DetailTable';
import Period from '../components/Period';
import Loader from '../components/UI/Loader';
import Chart from '../components/Chart';

export default class HourAnalysis extends Component {

  state = {
    loading: true,
    stats: {},
    period: '',
    summaryTables: null,
    chartSummary: null,
    chartData: null
  };

  componentWillMount(){
    console.log(this)
    createFiltersData(this);
  }

  componentDidMount(){
    this.getComponentData();
  }

  getComponentData = () => {
    this.setState({ loading: true });
    axios
      .get(
        `${
          this.props.root_url
        }/api/v1/statistics/chart?type=hour_analysis&store=${
          this.state.store.value
        }&department=${this.state.department.value}&year_start=${
          this.state.year.value
        }&month_start=${this.state.month.value}`
      )
      .then(res => {
        this.setState({
          loading: false,
          chartData: {
            ...res.data.chart,
            labels: res.data.chart.labels
          },
        });
        getPeriod(this);
      })
      .catch(error => {
        this.setState({
          loading: false
        });
      });
  };

  // handleSubmit = (e, month) => {
  //   e.preventDefault();
  //   this.setState(state => ({
  //     loading: !state.loading
  //   }));
  //   axios.get(`${this.props.root_url}/api/v1/statistics/chart?type=hour_analysis&store=13&department=3&year_start=2019&month_start=${this.state.month.value}`)
  //     .then(res => {
  //       this.setState({chartData: res.data, loading: false})
  //   })
  // }

  render() {
    const { period, department, departmentOptions, worldOptions, world, year, yearOptions, month, monthOptions, chartData } = this.state;

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
            {chartData && <Chart chartData={chartData} />}
          </div>
        </div>
        {/* <div className="col-12 mb-2">
          <div className="card dashboard__chart">
            <nav>
              <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Horas</a>
                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Pesos</a>
              </div>
            </nav>
            <div className="card dashboard__chart">
              {chartData && <Chart chartData={chartData} />}
            </div>
          </div>
        </div>
        <ProductivityTable/>
        <DetailTable/> */}
      </React.Fragment>
    );
  }
}
