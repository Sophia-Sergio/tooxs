import React, { Component } from 'react';
import PropTypes from 'prop-types';

export default class Header extends Component {
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
            <h3>{this.props.title}</h3>
          </div>
        </div>
      </div>
    );
  }
}

Header.defaultProps = {
  title: 'Dashboard title'
};

Header.propTypes = {
  title: PropTypes.string.isRequired
};
