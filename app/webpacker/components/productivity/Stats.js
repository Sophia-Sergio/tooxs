import React, { Component } from 'react'
import PropTypes from 'prop-types'
import StatsItem from './StatsItem'

class Stats extends Component {
  state = {
    statistics: [
      {
        id: 1,
        name: 'Productividad sin optimizar',
        value: 57191,
        description: ''
      },
      {
        id: 2,
        name: 'Productividad optimizada',
        value: 85692,
        description: ''
      },
      {
        id: 3,
        name: 'Productividad ideal',
        value: 85000,
        description: ''
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
