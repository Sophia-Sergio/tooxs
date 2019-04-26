import React, { Component } from 'react';

const period = (props) => (
  <div className="col-12 mb-2">
    <div className="card dashboard__chart">
      <p className="card-text">{ props.period }</p>
    </div>
  </div>
)
export default period;