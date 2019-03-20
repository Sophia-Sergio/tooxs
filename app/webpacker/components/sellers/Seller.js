import React, { Component } from "react"
import PropTypes from "prop-types"

class Seller extends Component {
  render () {
    const { employee } = this.props;
    return (
      <div className="col-xl-4 mb-2 dashboard__user-main-items__item">
        <div className="card dashboard__user-main">
          <div className="dashboard__user-main__avatar">
            <figure>
              <img
                src={ employee.avatar != '' ? employee.avatar : userDefault}
                alt={`${employee.name} ${employee.surename_1}`}
                />
            </figure>
          </div>
          <div className="dashboard__user-main__info">
            <h3 className="name">
              {`${employee.name} ${employee.surname_1}`}
            </h3>
            <h4 className="position">Vendedor</h4>
            <a className="email" href={'mailto:' + employee.email}>{employee.email}</a>
            <a className="phone" href={'tel:' + employee.phone}>{employee.phone}</a>
            { employee.working_today && <h5 className="working-today">En turno</h5> }
          </div>
        </div>
      </div>
    );
  }
}

export default Seller;
