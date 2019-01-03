import React, {Component} from 'react';
import axios from 'axios';
import { currencyFormat } from "./helpers";
import {Line} from 'react-chartjs-2';

class LineChart extends Component {
  constructor(){
    super();
    this.state = {
      chartData: {}
    }
  }

  componentWillMount(){
  }

  componentDidMount(){
    /*this.props.fetchMetaData(this.props.url);*/
    axios.get(`http://localhost:3000/api/v1/statistics/graph?type=efficiency&year_start=2018&month_start=7&year_end=2018&month_end=10`)
      .then(res => {
        console.log(res);
        this.setState({chartData: res.data})
    })

  }

  getChartData(){
    // Ajax calls here
    // http://tooxs-demo.herokuapp.com/sales_cluster/json_month?utf8=%E2%9C%93&cluster=1&department=1&year=2018&month=5&week=

    this.setState({
      chartData:{
        labels: ['30', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27'],
        datasets:[
          {
            label:'Alto Las Condes',
            data: [
              5359500,
              5413095,
              5627475,
              5681070,
              6431400,
              7074540,
              6945912,
              5198715,
              5685896,
              5740025,
              5879908,
              6437832,
              7003794,
              6952858,
              5250704,
              5231022,
              5797425,
              5821107,
              6759724,
              7283946,
              7217421,
              5520170,
              5584699,
              5833964,
              5875326,
              6659346,
              7335278,
              7201243
            ],
            backgroundColor: 'rgba(71, 196, 254, .2)',
            borderColor: 'rgba(71, 196, 254, 1)',
            borderWidth: 2,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderWidth: 2,
            pointRadius: 5,
          },
          {
            label:'Parque Arauco',
            data: [
              9240896,
              9606873,
              9698367,
              10979284,
              12077210,
              11857625,
              8874921,
              9706600,
              9799010,
              10037810,
              10990263,
              11956438,
              11869483,
              8963669,
              8930073,
              9897000,
              9937431,
              11539774,
              12434696,
              11750788,
              10263439,
              7796288,
              7765439,
              8647414,
              8650569,
              10070602,
              10858338,
              10252468
            ],
            backgroundColor: 'rgba(137, 218, 89, .2)',
            borderColor: 'rgba(137, 218, 89, 1)',
            borderWidth: 2,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderWidth: 2,
            pointRadius: 5,
          },
        ]
      },
      chartOptions: {
        maintainAspectRatio: false,
        responsive: true,
      }
    });
  }

  render() {
    return (
      <Line
        data={this.state.chartData}
        height={400}
        options={this.state.chartOptions}
      />
    );
  }
}

export default LineChart