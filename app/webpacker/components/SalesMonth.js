import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat } from './helpers';
import Loader from "./layout/Loader";
import Select from 'react-select';
import {Line} from 'react-chartjs-2';
import MonthTable from './sales/MonthTable';

class SalesMonth extends Component {
  constructor(props){
    super(props);
    this.state = {
      loading: false,
      result: '',
      store: { value: '12', label: 'Alto Las Condes' },
      storeOptions: [
        { value: '12', label: 'Alto Las Condes' }
      ],
      department: { value: '12', label: 'Juvenil mujer' },
      departmentOptions: [
        { value: '12', label: 'Juvenil mujer' }
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
        labels: ['30','01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27'],
        datasets:[
          {
            label: 'Real',
            fill: 'true',
            data: [5359500,5413095,5627475,5681070,6431400,7074540,6945912,5198715,5685896,5740025,5879908,6437832,7003794,6952858,5250704,5231022,5797425,5821107,6759724,7283946,7217421,5520170,5584699,5833964,5875326,6659346,7335278,7201243],
            backgroundColor: 'rgba(71, 196, 254, .2)',
            borderColor: 'rgba(71, 196, 254, 1)',
            borderWidth: 2,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderWidth: 2,
            pointRadius: 5,
          },
          {
            label: 'Plan',
            fill: 'false',
            data: [5506846,4997336,6080240,5984187,7370253,7866186,7076165,5691018,5747927,5975567,6032479,6829221,7512142,7375558,5520285,6037601,6095079,6243615,6836051,7437022,7382935,5686464,5743328,5970789,6027651,6823757,7506133,7369659],
            backgroundColor: 'rgba(137, 218, 89, .2)',
            borderColor: 'rgba(137, 218, 89, 1)',
            borderWidth: 2,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderWidth: 2,
            pointRadius: 5,
          },
          {
            label: 'Histórico',
            fill: 'false',
            data:[5098931,4627165,5629850,5540914,6824309,7283508,6552004,5269461,5322155,5532934,5585628,6323352,6955688,6829221,5111377,5590371,5643592,5781125,6329676,6886132,6836051,5265247,5317900,5528507,5581160,6318295,6950125,6823757],
            backgroundColor: 'rgba(227, 58, 62, .2)',
            borderColor: 'rgba(227, 58, 62, 1)',
            borderWidth: 2,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderWidth: 2,
            pointRadius: 5,
          }
        ],
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
    this.createFiltersData();
  }

  componentDidMount(){
    this.getChartData();
  }

  createFiltersData(){
  }

  getChartData(){
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
    this.getChartData();
    this.getEmployeesData();
  }

  // Departamento, Año, Mes

  render() {
    const { store, storesOptions, department, departmentOptions, year, yearOptions, month, monthOptions, employees } = this.state;

    return (
      <React.Fragment>
        {this.state.loading && <Loader/>}
        <div className="col-12 mb-2">
          <div className="card dashboard__filter">
            <form onSubmit={this.handleSubmit}>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={this.storeChange}
                  options={storesOptions}
                  placeholder={`Tienda`}
                  value={store}
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
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={this.yearChange}
                  options={yearOptions}
                  placeholder={`Año`}
                  value={year}
                />
              </div>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={this.monthChange}
                  options={monthOptions}
                  placeholder={`Mes`}
                  value={month}
                />
              </div>
              <button className="btn btn-primary" type="submit">Buscar</button>
            </form>
          </div>
        </div>
        <div class="col-12 mb-2">
          <div class="card dashboard__chart">
            <button type="button" class="btn btn-sm btn-primary btn-compare-sales" data-target="#modalFillIn" data-toggle="modal" id="btnFillSizeToggler2"><i class="fa fa-exchange"></i> Comparar </button>
          </div>
        </div>
        <div class="modal fade slide-right" id="modalFillIn" tabindex="-1" role="dialog" aria-hidden="true">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
            <i class="pg-close"></i>
          </button>
          <div class="modal-dialog ">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="text-left p-b-5"><span class="semi-bold">Seleccione Tienda para Comparación</span></h5>
              </div>
              <div class="modal-body">
                <div class="row">
                  <div class="col-12 ">
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
              </div>
            </div>
          </div>
        </div>
        <div className="col-12 mb-2">
          <div className="card dashboard__chart">
            <h5 className="card-title">Gráfico de ventas</h5>
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
        <MonthTable/>
      </React.Fragment>
    );
  }
}

export default SalesMonth;