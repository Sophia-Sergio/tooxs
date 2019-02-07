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
      month = 'Nomviembre';
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
  let newDate = day + '/' + month;
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
