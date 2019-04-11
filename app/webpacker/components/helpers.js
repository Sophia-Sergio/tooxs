import axios from 'axios';

export function currencyFormat(clp) {
  return (clp).toLocaleString('de-DE', {
    minimumFractionDigits: 0,
    maximumFractionDigits: 0
  });
}

export function rando(arr) {
  return arr[Math.floor(Math.random() * arr.length)];
}

export function monthFormat(num) {
  let month;
  switch(num) {
    case 1:
      month = 'Enero';
      break;
    case 2:
      month = 'Febrero';
      break;
    case 3:
      month = 'Marzo';
      break;
    case 4:
      month = 'Abril';
      break;
    case 5:
      month = 'Mayo';
      break;
    case 6:
      month = 'Junio';
      break;
    case 7:
      month = 'Julio';
      break;
    case 8:
      month = 'Agosto';
      break;
    case 9:
      month = 'Septiembre';
      break;
    case 10:
      month = 'Octubre';
      break;
    case 11:
      month = 'Noviembre';
      break;
    case 12:
      month = 'Diciembre';
      break;
  }
  return month;
}

export function dayMonthFormat(date) {
  let unformatDate = new Date(date);
  let month = unformatDate.getMonth()+1;
  let day = unformatDate.getDate();
  if(month < 10){ month = '0' + month };
  if(day < 10){ day = '0' + day };
  let newDate = day + '-' + month;
  return newDate;
}

export function slugify(text) {
  return text
    .toString()
    .toLowerCase()
    .replace(/\s+/g, "-")
    .replace(/[^\w-]+/g, "")
    .replace(/--+/g, "-")
    .replace(/^-+/, "")
    .replace(/-+$/, "");
}

export function  getDepartments(worlds, world) {
  for (var w of worlds) {
    if (w['id'] == world['value']) {
      return w['departments'];
    }
  }
}

export function  getBiggerDepartment(worlds, world) {
  for (var w of worlds) {
    if (w['id'] == world['value']) {
      return w['bigger_department'];
    }
  }
}

export function getPeriod(_this){
  var parameters = `year_start=${_this.state.year.value}&month_start=${_this.state.month.value}`;
  axios.get(`${_this.props.root_url}/api/v1/periods/filter_period?${parameters}`)
    .then(res => {
      const start = new Date(res.data.start);
      const startYear = start.getFullYear();
      const startMonth = start.getMonth();
      const startDay = start.getDate();
      const end = new Date(res.data.end);
      const endYear = end.getFullYear();
      const endMonth = end.getMonth();
      const endDay = end.getDate();
      _this.setState({
        period: `Datos desde el ${ startDay + 1} de ${ monthFormat(startMonth + 1) } de ${ startYear } al ${ endDay +1 } de ${ monthFormat(endMonth + 1) } de ${ endYear }`,
      });
      _this.setState({loading: false});
    })
    .catch(error => {
      console.log(error);
    });
  return;
};