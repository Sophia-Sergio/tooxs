import React, { Component } from 'react';

class Period extends Component {
  render() {
    const { title, period } = this.props;

    return (
      <div className="col-12 mb-2">
        <div className="card dashboard__chart">
          { title &&
            <h5 className="card-title">{ title }</h5>
          }
          <p className="card-text">{ period }</p>
        </div>
      </div>
    );
  }
}

Period.defaultProps = {
  title: '',
  period: '',
};

export default Period;
