import React, { Component } from "react";
import PropTypes from "prop-types";

class Employee extends Component {
  render () {
    const { name, sell, goal, shift, objective, link } = this.props.employee;
    const formatter = new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
      minimumFractionDigits: 0,
      maximumFractionDigits: 0,
    });

    return (
      <tr>
        <td className="">
          <div className="thumbnail">
            <img src={this.props.avatar} alt="{name}" />
          </div>
        </td>
        <td>{name}</td>
        <td>{formatter.format(sell)}</td>
        <td>{formatter.format(goal)}</td>
        <td>{shift}</td>
        <td className="progress-container">
          <div className="progress">
            <span className="progress-value">{objective}%</span>
            <div className="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style={{width: objective + '%'}}>
            </div>
          </div>
        </td>
        <td>
          <a className="link" href={link}><i className="fa fa-caret-right"></i></a>
        </td>
    	</tr>
    );
  }
}

Employee.propTypes = {
  name: PropTypes.string,
  avatar: PropTypes.string,
  sell: PropTypes.string,
  goal: PropTypes.string,
  shift: PropTypes.string,
  objective: PropTypes.string,
  link: PropTypes.string,
};

export default Employee
