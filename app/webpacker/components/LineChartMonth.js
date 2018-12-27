import React, {Component} from 'react';
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
    this.getChartData();
  }

  componentDidMount(){
    console.log(this.state.chartData);
  }

  getChartData(){
    // Ajax calls here
    // http://tooxs-demo.herokuapp.com/sales_cluster/json_month?utf8=%E2%9C%93&cluster=1&department=1&year=2018&month=5&week=

    this.setState({
      chartData: {
        labels: [ "30", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27" ],
        datasets: [
          {
            label: "Real",
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
            label: 'Plan',
            data: [
              5506846,
              4997336,
              6080240,
              5984187,
              7370253,
              7866186,
              7076165,
              5691018,
              5747927,
              5975567,
              6032479,
              6829221,
              7512142,
              7375558,
              5520285,
              6037601,
              6095079,
              6243615,
              6836051,
              7437022,
              7382935,
              5686464,
              5743328,
              5970789,
              6027651,
              6823757,
              7506133,
              7369659
            ],
            backgroundColor: 'rgba(137, 218, 89, .2)',
            borderColor: 'rgba(137, 218, 89, 1)',
            borderWidth: 2,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderWidth: 2,
            pointRadius: 5,
          },
          {
            label: "Histórico",
            data: [
              5098931,
              4627165,
              5629850,
              5540914,
              6824309,
              7283508,
              6552004,
              5269461,
              5322155,
              5532934,
              5585628,
              6323352,
              6955688,
              6829221,
              5111377,
              5590371,
              5643592,
              5781125,
              6329676,
              6886132,
              6836051,
              5265247,
              5317900,
              5528507,
              5581160,
              6318295,
              6950125,
              6823757
            ],
            backgroundColor: 'rgba(255,51,75, 0)',
            borderColor: 'rgba(255,51,75, 1)',
            borderWidth: 2,
            pointBackgroundColor: 'rgba(255, 255, 255, 1)',
            pointBorderWidth: 2,
            pointRadius: 5,
          }
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