import React, { Component } from 'react';
import BootstrapTable from 'react-bootstrap-table-next';
import Select from 'react-select';
import DayPickerInput from 'react-day-picker/DayPickerInput';
import MomentLocaleUtils, { formatDate, parseDate,} from 'react-day-picker/moment';
import 'moment/locale/es';
import DotationComparative from './staffing/DotationComparative';
import PropTypes from 'prop-types';

class StaffingIndex extends Component {
  state = {
    loading: true,
    result: '',
    store: { value: '12', label: 'Alto Las Condes' },
    storeOptions: [{ value: '12', label: 'Alto Las Condes' }],
    employees: [
    ]
  }
  render () {
    const { store, storesOptions } = this.state;
    return (
      <React.Fragment>
        <div className="col-12 mb-2">
          <div className="card dashboard__filter">
            <form onSubmit={this.handleSubmit}>
              <div className="form-group">
                <Select
                  noOptionsMessage={() => 'No se econtraron más opciones'}
                  onChange={this.storeChange}
                  options={storesOptions}
                  placeholder={`Tienda`}
                  value={store}
                />
              </div>
              <div className="form-group">
                <DayPickerInput
                  dayPickerProps={{locale: 'es', localeUtils: MomentLocaleUtils}}
                  format="DD-MM-YYYY"
                  formatDate={formatDate}
                  parseDate={parseDate}
                  locale="es"
                />
              </div>
              <button className="btn btn-primary" type="submit">Buscar</button>
            </form>
          </div>
        </div>
        <DotationComparative/>
      </React.Fragment>
    );
  }
}

export default StaffingIndex;
