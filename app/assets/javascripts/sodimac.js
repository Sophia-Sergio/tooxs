(function($){
  tDetails = $('.table-details').DataTable({
    'bLengthChange': false,
    'bFilter': true,
    'bInfo': false,
    'bAutoWidth': true,
    'searching': false
  })
  let tableBody = document.getElementById('table-details')
  const getDetail = e => {
    let targetEl = e.target.parentElement || e.srcElement.parentElement
    let detailTitle = targetEl.getElementsByTagName('td')[0].innerText || targetEl.getElementsByTagName('td')[0].innerText
    let detailShifts = targetEl.getElementsByTagName('td')[1].innerText || targetEl.getElementsByTagName('td')[1].innerText
    fetch('https://jsonplaceholder.typicode.com/users')
    .then((response) => response.json())
    .then((data) => {
      output = `
        <thead>
          <tr>
            <th>Colaborador</th>
            <th>Turno</th>
          </tr>
        </thead>
        </tbody>
      `
      data.forEach(detail => {
        output += `
          <tr>
            <td>${detail.name}</td>
            <td>${detail.id}</td>
          </tr>
        `
      })
      output += '</tbody>'
      document.querySelector('.dashoboard-sodimac__cumplimiento__detalle-title').textContent = detailTitle
      document.getElementById('shifts').style.width = detailShifts
      table_details.innerHTML = output
    })
  }
  tableHanlde = document.querySelectorAll('.table-handle')
  for (var i = 0; i < tableHanlde.length; i++) {
    tableHanlde[i].addEventListener('click', getDetail)
  }
})( jQuery );