(function($){

  window.chartColors = {
    red: 'rgb(255, 99, 132)',
    orange: 'rgb(255, 159, 64)',
    yellow: 'rgb(255, 205, 86)',
    green: 'rgb(75, 192, 192)',
    blue: 'rgb(54, 162, 235)',
    purple: 'rgb(153, 102, 255)',
    grey: 'rgb(201, 203, 207)'
  }

  let randomScalingFactor = () => {
    return Math.round(Math.random() * 100)
  }

	let chartCumplimientoConfig = {
		type: 'pie',
		data: {
			datasets: [{
				data: [
          randomScalingFactor(),
          randomScalingFactor()
        ],
				backgroundColor: [
          window.chartColors.blue,
          window.chartColors.grey,
        ],
				label: 'Dataset 1'
			}],
			labels: [randomScalingFactor() + '% de cumplimiento']
		},
		options: {
      animation: {
        animateScale: true
      },
			responsive: true,
			tooltips: {
			    enabled: false
			}
		}
	}

	var chartEficienciaConfig = {
		type: 'pie',
		data: {
			datasets: [{
				data: [
          randomScalingFactor(),
          randomScalingFactor()
        ],
				backgroundColor: [  window.chartColors.red, window.chartColors.grey],
				label: 'Dataset 1'
			}],
			labels: [ randomScalingFactor() + '% de Eficiencia (Productividad objetivo 584 unidades / hora)' ]
		},
		options: {
      animation: {
        animateScale: true
      },
			responsive: true,
			tooltips: {
			    enabled: false
			}
		}
	}

	window.onload = () => {
    const ctx1 = $('#chart-cumplimiento')[0].getContext('2d')
    window.myPie = new Chart(ctx1, chartCumplimientoConfig)
    const ctx2 = $('#chart-eficiencia')[0].getContext('2d')
    window.myPie = new Chart(ctx2, chartEficienciaConfig)
	}

  //Secciones de Supermercado Owl Carousel
  $('.dashboard-market__tables__carousel').owlCarousel({
    dots: false,
    loop: false,
    margin: 15,
    nav: true,
    responsive:{ 0:{ items: 1 }, 480:{ items: 1 }, 992:{ items: 2 } }
  });
  // Custom Navigation Events
  $('.dashboard-market__tables__carousel__controls-next').click( function (e) {
    e.preventDefault();
    console.log('click');
      $('.dashboard-market__tables__carousel').trigger('next.owl.carousel');
  });

  $('.dashboard-market__tables__carousel__controls-prev').click( function (e) {
    e.preventDefault();
    console.log('click');
    $('.dashboard-market__tables__carousel').trigger('prev.owl.carousel');
  });

})( jQuery );