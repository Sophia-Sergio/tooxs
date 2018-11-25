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

  if($('#chart-area1').length > 0) {
    var ctx1 = document.getElementById('chart-area1').getContext('2d');
    window.myPie1 = new Chart(ctx1, config1);
  }
  if($('#chart-area2').length > 0){
    var ctx2 = document.getElementById('chart-area2').getContext('2d');
    window.myPie2 = new Chart(ctx2, config2);
  }
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
};
