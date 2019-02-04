import React, { Component } from 'react';
import Select from 'react-select';
import WeekSells from './WeekSells';

class MonthSells extends Component {
  state = {
    month: { value: '7', label: 'Julio' },
    monthOptions: [
      { value: '7', label: 'Julio' },
      { value: '6', label: 'Junio' },
      { value: '5', label: 'Mayo' }
    ],
  }
  render () {
    const { month, monthOptions } = this.state;
    const { month_sales } = this.props;
    return (
      <React.Fragment>
        <div className="tab-pane__content__head mb-2">
          <h3 className="tab-pane__content__head__title">Alto Las Condes - Juvenil Mujer</h3>
          <div className="form-group">
            <Select
              options={monthOptions}
              placeholder={`Departamento`}
              onChange={this.monthChange}
              value={month}
            />
          </div>
        </div>
        <ul className="tab-pane__content__list mb-4">
          <li>Plan mensual: <strong>$4.200.000</strong></li>
          <li>Ventas Plan / Real: <strong>$3.080.000 / $2.950.000</strong></li>
          <li>Mi cumplimiento a la fecha: <strong>78%</strong></li>
        </ul>
        {month_sales.map(month => (
          <WeekSells month={month} />
        ))}
      </React.Fragment>
    );
  }
}

export default MonthSells;
