import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat } from "./helpers";
import Select from 'react-select';
import {Line} from 'react-chartjs-2';
import { merge } from 'lodash';
import Stats from './Stats';
import ShiftPlan from './dashboard/ShiftPlan';
import EmployeesTable from './dashboard/EmployeesTable';

class MainDashboard extends Component {
  constructor(props){
    super(props);
    this.state = {
      loading: true,
      result: '',
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
        labels: [],
        datasets:[]
      },
      chartOptions: {
        tooltips: {
          mode: 'point'
        },
        maintainAspectRatio: false,
        responsive: true,
      },
      employees: [],
    }
  }

  componentWillMount(){
  }

  componentDidMount = () => {
    this.getChartData();
    this.getEmployeesData();
  }



  getChartData(){
    // Ajax calls here
    axios.get(`${this.props.root_url}/api/v1/statistics/graph?type=efficiency&store=${this.props.user.store_id}&department=${this.props.user.store_department_id}&year_start=2018&month_start=7`)
      .then(res => {
        this.setState({chartData: res.data, loading: false});

        // this.setState(prevState => ({
        //   chartData: {...prevState.chartData, kakita: 'something'}
        // }));

        // this.setState({
        //   chartData : {
        //     ...this.state.chartData,
        //     [datasets]: {
        //       ...this.state.chartData[datasets],
        //       bio: 'peo'
        //     }
        //   }
        // });

        this.setState(state => {
          state.chartData.datasets[0].backgroundColor = 'rgba(71, 196, 254, .2)';
          state.chartData.datasets[0].borderColor = 'rgba(71, 196, 254, 1)';
          state.chartData.datasets[0].borderWidth = 2;
          state.chartData.datasets[0].pointBackgroundColor = 'rgba(255, 255, 255, 1)';
          state.chartData.datasets[0].pointBorderWidth = 2;
          state.chartData.datasets[0].pointRadius = 5;
          state.chartData.datasets[1].backgroundColor = 'rgba(137, 218, 89, .2)';
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

  getEmployeesData(){
    // Ajax calls here
    axios.get(`http://localhost:3000/api/v1/employees/sellers_table?store=13&department=1&year_start=2018&month_start=7`)
      .then(res => {
        this.setState({employees: res.data});
      })
      .catch(error => {
        console.log(error);
      });
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
    const { department, departmentOptions, year, yearOptions, month, monthOptions, employees } = this.state;

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
            <Stats/>
            <div className="dashboard__chart__canvas">
              <Line
                data={this.state.chartData}
                options={this.state.chartOptions}
              />
            </div>
          </div>
        </div>
        <ShiftPlan/>
        <EmployeesTable employees={employees}/>
      </React.Fragment>
    );
  }
}

export default MainDashboard;