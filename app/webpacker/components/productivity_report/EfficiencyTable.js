import React, { Component } from 'react';

class EfficiencyTable extends Component {
  state = {
  }
  render () {
    const {} = this.state;
    return (
      <div className="col-12">
        <div className="card dashboard__table">
          <h5 className="card-title">Eficiencia</h5>
          <div className="table-responsive">
            <table className="table">
              <thead>
                <tr>
                  <th>Item</th>
                  <th>Valor %</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Nivel eficiencia optimizada</td>
                  <td>71,3%</td>
                </tr>
                <tr>
                  <td>Nivel esfuerzo sin optimizar</td>
                  <td>44,2%</td>
                </tr>
                <tr>
                  <td>Mejora de eficiencia</td>
                  <td>68,96%</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    );
  }
}

export default EfficiencyTable;
