import React, { Component } from "react"
import PropTypes from "prop-types"

class Objective extends Component {
  render () {
    const { employee } = this.props;
    return (
      <div className="col-xl-4 mb-2 dashboard__user-main-items__item">
        <div className="card dashboard__user-objective">
          <h5 className="card-title">Cumplimiento</h5>
          <div className="row dashboard__user-objective__goal">
            <h3 className="dashboard__user-objective__goal-percentage">75%</h3>
            <div className="dashboard__user-objective__goal-amounts">
              <p className="amount-item">Ventas: <span>$28.728.715</span></p>
              <p className="amount-item">Meta: <span>$32.903.750</span></p>
            </div>
          </div>
          <div className="dashboard__user-objective__shifts">
            <h5 className="dashboard__user-objective__shifts-title">Turno semana del 25 de febrero al 3 de marzo</h5>
            <ul className="dashboard__user-objective__shifts-week">
              <li className="day-active">L</li>
              <li className="day-active">M</li>
              <li className="day-active">M</li>
              <li>J</li>
              <li className="day-active">V</li>
              <li className="day-active">S</li>
              <li>D</li>
            </ul>
          </div>
        </div>
      </div>
    );
  }
}

export default Objective;
