import React, { Component } from 'react'
import PropTypes from 'prop-types'
import StatsItem from './StatsItem'

class Stats extends Component {
  state = {
    statistics: [
      {
        id: 1,
        name: 'Cumplimiento plan de venta',
        value: '95.55%',
        description: 'Plan $180.725.494. Real $172.803.395'
      },
      {
        id: 2,
        name: 'Productividad real',
        value: '$54.875',
        description: 'Productividad objetivo $85.000'
      },
      {
        id: 3,
        name: 'Cumplimiento de eficacia',
        value: '58.78%',
        description: 'Eficiencia objetivo 75%'
      },
    ]
  }

  render () {
    const { statistics } = this.state;

    return (
      <div className="row dashboard__chart__info">
        {statistics.map(statistic => (
          <StatsItem
            key={statistic.id}
            statistic={statistic}
          />
        ))}
      </div>
    );
  }
}

Stats.propTypes = {
  statistics: PropTypes.object.isRequired
};

export default Stats
