import React, { Component } from 'react';
import PropTypes from 'prop-types';
import { currencyFormat } from '../helpers';

class StatsItem extends Component {
  render () {
    const { name, value, description } = this.props.statistic;

    return (
      <div className="col-md-4">
        <div className="card dashboard__chart__info__item">
          <h5 className="dashboard__chart__info__item__title">{ name }</h5>
          <h6 className="dashboard__chart__info__item__value">{ '$' + currencyFormat(value) }</h6>
          { description != '' && `<p className="dashboard__chart__info__item__text">${ description }</p>` }
        </div>
      </div>
    );
  }
}

StatsItem.propTypes = {
  name: PropTypes.string,
  value: PropTypes.string,
  description: PropTypes.string,
};

export default StatsItem;
