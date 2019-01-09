import React, {Component} from 'react';
import Select from 'react-select';

class PageFilter extends Component {
  render () {
    return (
      <div className="col-12 mb-2">
        <div className="card dashboard__filter">
          <form onSubmit={this.handleSubmit}>
            <div className="form-group">
              <Select
                options={departmentOptions}
                placeholder={`Departamento`}
                onChange={this.departmentChange}
                value={department}
              />
            </div>
            <div className="form-group">
              <Select
                options={yearOptions}
                placeholder={`Año`}
                onChange={this.yearChange}
                value={year}
              />
            </div>
            <div className="form-group">
              <Select
                options={monthOptions}
                placeholder={`Mes`}
                onChange={this.monthChange}
                value={month}
              />
            </div>
            <button className="btn btn-primary" type="submit">Buscar</button>
          </form>
        </div>
      </div>
    );
  }
}

export default PageFilter;