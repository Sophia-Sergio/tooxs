import React, { Component } from 'react';
import PropTypes from 'prop-types';
import StatsItem from './StatsItem';

const stats = props => (
  <div className="row dashboard__chart__info">
    {props.chartSummary.map((item, index) => (
      <StatsItem key={index} {...item} />
    ))}
  </div>
);

stats.propTypes = {
  chartSummary: PropTypes.array.isRequired
};

export default stats;
