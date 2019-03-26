import React, { Component } from "react"
import PropTypes from "prop-types"

class Distance extends Component {
  render () {
    const { employee } = this.props;
    return (
      <div className="col-xl-4 mb-2 dashboard__user-main-items__item">
        <div className="card dashboard__user-distance">
          <h5 className="card-title">{employee.store}</h5>
          <div className="dashboard__user-distance__info">
            <div className="dashboard__user-distance__info-item">
              <h5 className="title">Departamento</h5>
              <h4 className="info">{employee.department}</h4>
            </div>
            <div className="dashboard__user-distance__info-item">
              <h5 className="title">Activo desde</h5>
              <h4 className="info">Domingo 01 de Octubre 2017</h4>
            </div>
            <div className="dashboard__user-distance__info-item">
              <h5 className="title">Turno asignado</h5>
              <h4 className="info">{employee.work_shift}</h4>
            </div>
          </div>
          <div className="row dashboard__user-distance__map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26640.98297296774!2d-70.59306204449308!3d-33.42004081403936!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9662cfa4ad4b79c7%3A0x39925f922816f250!2sBrown+Nte%2C+Providencia%2C+Regi%C3%B3n+Metropolitana!5e0!3m2!1ses!2scl!4v1553114923758" width="100%" height="100" frameBorder="0"></iframe>
          </div>
          <div className="dashboard__user-distance__times">
            <h4 className="info-item">Residencia: <span>{employee.address}, {employee.commune}, {employee.city}</span></h4>
            <h4 className="info-item">Distancia residencia-tienda: <span>15 kilometos (1 hora aprox.)</span></h4>
          </div>
        </div>
      </div>
    );
  }
}

export default Distance;
