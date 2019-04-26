import React, { Component } from "react";
import PropTypes from "prop-types";

const statsItem = props => {
  const { label, data, description } = props;
  return (
    <div className="col-md-4">
      <div className="card dashboard__chart__info__item">
        <h5 className="dashboard__chart__info__item__title">{ label }</h5>
        <h6 className="dashboard__chart__info__item__value">{ data }</h6>
        { description && <p className="dashboard__chart__info__item__text">{ description }</p> }
      </div>
    </div>
  );
}
statsItem.propTypes = {
  name: PropTypes.string,
  value: PropTypes.string,
  description: PropTypes.string,
};

export default statsItem;
