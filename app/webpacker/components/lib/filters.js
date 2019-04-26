export function getMonths(years, year) {
  for (var y of years) {
    if (y['label'] == year['value']) {
      return y['months'];
    }
  }
}

export function getDepartments(worlds, world) {
  for (var w of worlds) {
    if (w['id'] == world['value']) {
      return w['departments'];
    }
  }
}

export function getBiggerDepartment(worlds, world) {
  for (var w of worlds) {
    if (w['id'] == world['value']) {
      return w['bigger_department'];
    }
  }
}

export function departmentChange(department, _this) {
  _this.setState({ department });
}

export function yearChange(year, _this) {
  const monthOptions = getMonths(_this.props.filters.years, year);
  _this.setState({
    year: year,
    monthOptions: monthOptions
  });
}

export function monthChange(month, _this) {
  _this.setState({ month });
}

export function worldChange(world, _this) {
  const worlds = _this.props.filters.worlds_departments;
  const departmentOptions = getDepartments(worlds, world);
  const department = getBiggerDepartment(worlds, world);
  _this.setState({
    world,
    departmentOptions: departmentOptions.map(store => ({
      value: store.id,
      label: store.name
    })),
    department: { value: department.id, label: department.name }
  });
}

export function createFiltersData1(_this) {
    var filters = _this.props.filters;
    var world = {
      value: filters.world_selected.id,
      label: filters.world_selected.name
    };
    var departments = getDepartments(filters.worlds_departments, world);
    var department = getBiggerDepartment(filters.worlds_departments, world);
    var monthOptions = getMonths(filters.years, filters.year);
    _this.setState({
      year: { value: filters.year.value, label: filters.year.label },
      month: { value: filters.month.value, label: filters.month.label },
      store: { value: filters.store.id, label: filters.store.name },
      world: world,
      yearOptions: filters.years.map(year => ({
        value: year.value,
        label: year.label
      })),
      monthOptions: monthOptions.map(month => ({
        value: month.value,
        label: month.label
      })),
      worldOptions: filters.worlds_departments.map(world => ({
        value: world.id,
        label: world.name
      })),
      department: { value: department.id, label: department.name },
      departmentOptions: departments.map(store => ({
        value: store.id,
        label: store.name
      }))
    });
  }