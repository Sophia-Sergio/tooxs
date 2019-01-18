import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat } from "./helpers";
import Select from 'react-select';
import {Line} from 'react-chartjs-2';
import { merge } from 'lodash';
import ComparativeTable from './sales_cluster/ComparativeTable';

class ComparativeSales extends Component {
  constructor(props){
    super(props);
    this.state = {
      loading: false,
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
      chartData: {
        labels: ["30","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27"],
        datasets:[
          {
            label: "Alto Las Condes",
            data: [5359500,5413095,5627475,5681070,6431400,7074540,6945912,5198715,5685896,5740025,5879908,6437832,7003794,6952858,5250704,5231022,5797425,5821107,6759724,7283946,7217421,5520170,5584699,5833964,5875326,6659346,7335278,7201243],
            backgroundColor: 'rgba(71, 196, 254, .2)',
            borderColor: 'rgba(71, 196, 254, 1)',
            borderWidth: 2,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderWidth: 2,
            pointRadius: 5,
          },
          {
            label: "Parque Arauco",
            data:[9240896,9606873,9698367,10979284,12077210,11857625,8874921,9706600,9799010,10037810,10990263,11956438,11869483,8963669,8930073,9897000,9937431,11539774,12434696,11750788,10263439,7796288,7765439,8647414,8650569,10070602,10858338,10252468],
            backgroundColor: 'rgba(137, 218, 89, .2)',
            borderColor: 'rgba(137, 218, 89, 1)',
            borderWidth: 2,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderWidth: 2,
            pointRadius: 5,
          }
        ]
      },
      chartOptions: {
        tooltips: {
          mode: 'point'
        },
        maintainAspectRatio: false,
        responsive: true,
      },
    }
  }

  componentWillMount(){
  }

  // componentDidMount = () => {
  //   axios.get(`${this.props.root_url}/api/v1/statistics/graph?type=efficiency&store=${this.props.user.store_id}&department=${this.props.user.store_department_id}&year_start=2018&month_start=7`)
  //     .then(res => {
  //       this.setState({chartData: res.data, loading: false});
  //       this.setState(state => {
  //         backgroundColor = 'rgba(71, 196, 254, .2)';
  //         state.chartData.datasets[0].borderColor = 'rgba(71, 196, 254, 1)';
  //         state.chartData.datasets[0].borderWidth = 2;
  //         state.chartData.datasets[0].pointBackgroundColor = 'rgba(255, 255, 255, 1)';
  //         state.chartData.datasets[0].pointBorderWidth = 2;
  //         state.chartData.datasets[0].pointRadius = 5;
  //         state.chartData.datasets[1].backgroundColor = 'rgba(137, 218, 89, .2)';
  //         state.chartData.datasets[1].borderColor = 'rgba(137, 218, 89, 1)';
  //         state.chartData.datasets[1].borderWidth = 2;
  //         state.chartData.datasets[1].pointBackgroundColor = 'rgba(255, 255, 255, 1)';
  //         state.chartData.datasets[1].pointBorderWidth = 2;
  //         state.chartData.datasets[1].pointRadius = 5;
  //         return state
  //       })
  //     })
  //     .catch(error => {
  //       console.log(error);
  //     });
  // }

  getChartData(){
    // Ajax calls here
  }

  departmentChange = (department) => {
    this.setState({ department });
    console.log(`Option selected:`, department);
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
    this.setState(state => ({
      loading: !state.loading
    }));
    axios.get(`${this.props.root_url}/api/v1/statistics/graph?type=efficiency&store=13&department=${this.state.department.value}&year_start=2018&month_start=${this.state.month.value}`)
      .then(res => {
        this.setState({chartData: res.data, loading: false})
    })
  }

  // Departamento, Año, Mes

  render() {
    const { department, departmentOptions, year, yearOptions, month, monthOptions } = this.state;

    return (
      <React.Fragment>
        {this.state.loading && <p>Loading...</p>}
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
          <div className="card dashboard__chart">
            <h5 className="card-title">Resultado de búsqueda</h5>
            <p className="card-text">Datos desde el 30 de abril al 27 de mayo de 2018</p>
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
        <div className="col-12 mb-2">
          <div className="card dashboard__table">
            <ComparativeTable/>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default ComparativeSales;