window.onload = function() {
  $('#sale_plans').DataTable();
  $('#historic_sales').DataTable();
  $('#tabla-colaboradores').dataTable( { "pageLength": 20 } );
  $('#seller-table').DataTable();


  $.fn.datepicker.dates['es'] = {
    days: ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Vienes", "Sábado"],
    daysShort: ["Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab"],
    daysMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
    months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
    monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
    today: "Hoy",
    clear: "Limpiar",
    format: "dd/mm/yyyy",
    titleFormat: "MM yyyy", /* Leverages same syntax as 'format' */
    weekStart: 1
  };

  $('.date').datepicker({
    language: 'es',
    autoclose: true,
  });

  if($('#market-plan-compliance').length > 0){
    new Chart(document.getElementById("market-plan-compliance").getContext('2d'), {
      type: 'pie',
      data: {
      labels: ["76.6% de cumplimiento"],
      datasets: [{
          label: "cumplimiento",
          backgroundColor: ['rgb(54, 162, 235)','rgb(201, 203, 207)'],
          data: [1500,433]
      }]
      },
      options: {
        responsive: true
      }
    });
  }
  if($('#market-efficiency').length > 0){
    new Chart(document.getElementById("market-efficiency").getContext('2d'), {
      type: 'pie',
      data: {
      labels: ["67.02% de Eficiencia (Productividad objetivo 584 unidades/hora)"],
      datasets: [{
          label: "unidades",
          backgroundColor: ['rgb(255, 99, 132)','rgb(201, 203, 207)'],
          data: [784,433]
      }]
      },
      options: {
        responsive: true
      }
    });
  }
  remove_active = function(element){
    element.removeClass('active')
  }
  add_active = function(element){
    element.addClass('active')
  }
  $('.tottus').click(function(){
    remove_active($('.falabella').parent());
    remove_active($('.sodimac').parent());
    add_active($('.tottus').parent());
    $('.hour-switch').removeClass('inactive');
  })
  $('.falabella').click(function(){
    remove_active($('.tottus').parent());
    remove_active($('.sodimac').parent());
    add_active($('.falabella').parent());
    $('.hour-switch').addClass('inactive');
  })
  $('.sodimac').click(function(){
    remove_active($('.tottus').parent());
    remove_active($('.falabella').parent());
    add_active($('.sodimac').parent());
    $('.hour-switch').removeClass('inactive');
  })

  if($('#chart-area1').length > 0) {
    setTimeout(function(){
      var form = $('#dasboard_form').serializeArray();
      var data = {};
      $.map(form, function(field, i){
        data[field['name']] = field['value'];
      })

      $.ajax({
        type: "POST",
        url: '/efficiency/report_post',
        data: data,
        success: function(data){
          load_chart(data)
        },
        dataType: 'json'
      });
    }, 1000)
  }

  load_chart = function(data){
    var config = {
      type: 'line',
      data: {
        labels: data.fecha,
        datasets: [
          {
            backgroundColor: chartColors.greenAlfa,
            borderColor: chartColors.green,
            pointBackgroundColor: 'white',
            pointBorderWidth: 2,
            pointRadius: 5,
            data: data.prod_w_real,
            label: 'Eficiencia real'
          },
          {
            backgroundColor: chartColors.blueAlfa,
            borderColor: chartColors.blue,
            data: data.prod_w_op,
            label: 'Eficiencia óptima'
          },
        ],
      },
      options: {
        maintainAspectRatio: false,
        responsive: true,
      }
    };
    var ctx1 = document.getElementById('chart-area1').getContext('2d');
    window.myPie1 = new Chart(ctx1, config);
  }

};
