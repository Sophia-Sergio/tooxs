import React, {Component} from 'react';
import Select from 'react-select';

class Filter extends Component {
  constructor(props){
    super(props);
    this.state = {
      store: {},
      department: {},
      year: {},
      yearOptions: [],
      month: {},
      monthOptions: [],
    }
  }

  componentDidMount(){
    this.createFiltersData();
    this.props.onSubmit(this.state.currentYear, this.state.currentMonth);
  }

  createFiltersData(){
    var filters = this.props.filters;
    var world = { value: filters.world_selected.id, label: filters.world_selected.name };
    var departments = this.getDepartments(filters.worlds_departments, world);
    var department = this.getBiggerDepartment(filters.worlds_departments, world);
    var monthOptions = this.getMonths(filters.years, filters.year)
    this.setState({
      year: { value: filters.year.value, label: filters.year.label},
      month: { value: filters.month.value, label: filters.month.label},
      store: { value: filters.store.id, label: filters.store.name },
      world: world,
      yearOptions: filters.years.map( year => ({ value: year.value, label: year.label })),
      monthOptions: monthOptions.map( month => ({ value: month.value, label: month.label })),
      worldOptions: filters.worlds_departments.map( world => ({ value: world.id, label: world.name })),
      department: { value: department.id, label: department.name },
      departmentOptions: departments.map( store => ({ value: store.id, label: store.name }) )
    })
  }

  getDepartments(worlds, world){
    for (var w of worlds) {
      if (w['id']==world['value']){
        return w['departments']
      }
    }
  }

  getMonths(years, year){
    for (var y of years) {
      if (y['label']==year['value']){
        return y['months']
      }
    }
  }

  getBiggerDepartment(worlds, world){
    for (var w of worlds) {
      if (w['id']==world['value']){
        return w['bigger_department']
      }
    }
  }

  worldChange = (world) => {
    var departmentOptions = this.getDepartments(this.props.filters.worlds_departments, world)
    var department = this.getBiggerDepartment(this.props.filters.worlds_departments, world)
    this.setState({
      world: world,
      departmentOptions: departmentOptions.map( store => ({ value: store.id, label: store.name }) ),
      department: {value: department.id, label: department.name}
    });
  }

  storeChange = (store) => {
    this.setState({ store });
  }

  departmentChange = (department) => {
    this.setState({ department });
  }

  yearChange = (year) => {
    var monthOptions = this.getMonths(this.props.filters.years, year)
    this.setState({
      year: year,
      monthOptions: monthOptions
    });
  }

  monthChange = (month) => {
    this.setState({ month });
  }

  handleSubmit = (e, month) => {
    e.preventDefault();
  }

  render() {
    const {
      world,
      store,
      storesOptions,
      department,
      departmentOptions,
      worldOptions,
      year,
      yearOptions,
      month,
      monthOptions,
    } = this.state;

    return (
      <div className="col-12 mb-2">
        <div className="card dashboard__filter">
          <form onSubmit={this.handleSubmit}>
            <div className="form-group">
              <Select
                noOptionsMessage={() => 'No se econtraron más opciones'}
                onChange={this.worldChange}
                options={worldOptions}
                placeholder={`World`}
                value={world}
              />
            </div>
            <div className="form-group">
              <Select
                noOptionsMessage={() => 'No se econtraron más opciones'}
                onChange={this.departmentChange}
                options={departmentOptions}
                placeholder={`Departamento`}
                value={department}
              />
            </div>
            <div className="form-group">
              <Select
                noOptionsMessage={() => 'No se econtraron más opciones'}
                onChange={this.yearChange}
                options={yearOptions}
                placeholder={`Año`}
                value={year}
              />
            </div>
            <div className="form-group">
              <Select
                noOptionsMessage={() => 'No se econtraron más opciones'}
                onChange={this.monthChange}
                options={monthOptions}
                placeholder={`Mes`}
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

export default Filter;
