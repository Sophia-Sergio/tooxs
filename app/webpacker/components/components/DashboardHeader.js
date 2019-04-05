import React, { Component } from 'react';
import PropTypes from 'prop-types';

export default class DashboardHeader extends Component {
  handleClick(e) {
    const sidebar = document.querySelector('.sidebar');
    const mainContent = document.querySelector('.dashboard__container');
    e.preventDefault();
    sidebar.classList.toggle('open');
    mainContent.classList.toggle('translated');
  }

  render() {
    return (
      <div className="col-12">
        <div className="dashboard__header">
          <div className="dashboard__header__title">
            <button onClick={this.handleClick}>
              <i className="fa fa-bars" />
            </button>
            <h2>{this.props.title}</h2>
          </div>
        </div>
      </div>
    );
  }
}

DashboardHeader.defaultProps = {
  title: 'Dashboard title'
};

DashboardHeader.propTypes = {
  title: PropTypes.string.isRequired
};
