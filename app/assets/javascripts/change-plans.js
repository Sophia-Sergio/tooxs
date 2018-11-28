(function($){

  $('[name=number-format]').maskMoney({
    thousands: '.',
    decimal: '',
    precision: 0,
    allowZero: true,
    allowNegative: true,
  })

  $('.pct-week-one').change(function(e){
    let table = $(this).closest('.table')
    table.find('.amt-week-1').val(0)
    let pctVal = Number( $(this).val().replace(/\./g, '') )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekFive = Number( table.find('.week-five').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let weekFiveAdj = table.find('.week-five-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    weekOneAdj.text( Intl.NumberFormat('de-DE').format( ( ( pctVal / 100 ) * weekOne + weekOne ).toFixed(0) ) )
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, '')) + Number(weekFiveAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.pct-week-two').change(function(e){
    let table = $(this).closest('.table')
    table.find('.amt-week-2').val(0)
    let pctVal = Number( $(this).val().replace(/\./g, '') )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekFive = Number( table.find('.week-five').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let weekFiveAdj = table.find('.week-five-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    weekTwoAdj.text( Intl.NumberFormat('de-DE').format( ( ( pctVal / 100 ) * weekTwo + weekTwo ).toFixed(0) ) )
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, '')) + Number(weekFiveAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.pct-week-three').change(function(e){
    let table = $(this).closest('.table')
    let pctVal = Number( $(this).val().replace(/\./g, '') )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekFive = Number( table.find('.week-five').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let weekFiveAdj = table.find('.week-five-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.amt-week-3').val(0)
    weekThreeAdj.text( Intl.NumberFormat('de-DE').format( ( (pctVal / 100 ) * weekThree + weekThree).toFixed(0) ) )
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, '')) + Number(weekFiveAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.pct-week-four').change(function(e){
    let table = $(this).closest('.table')
    let pctVal = Number( $(this).val().replace(/\./g, '') )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let weekFiveAdj = table.find('.week-five-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.amt-week-4').val(0)
    weekFourAdj.text( Intl.NumberFormat('de-DE').format( ( ( pctVal / 100 ) * weekFour + weekFour ).toFixed(0) ) )
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, '')) + Number(weekFiveAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.pct-week-five').change(function(e){
    let table = $(this).closest('.table')
    let pctVal = Number( $(this).val().replace(/\./g, '') )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekFive = Number( table.find('.week-five').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let weekFiveAdj = table.find('.week-five-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.amt-week-5').val(0)
    weekFourAdj.text( Intl.NumberFormat('de-DE').format( ( ( pctVal / 100 ) * weekFour + weekFour ).toFixed(0) ) )
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, '')) + Number(weekFiveAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.amt-week-1').change(function(e){
    let table = $(this).closest('.table')
    let amtVal = Number( $(this).val().replace(/\./g, '') )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekFive = Number( table.find('.week-five').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let weekFiveAdj = table.find('.week-five-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.pct-week-one').val( 0 )
    weekOneAdj.text(Intl.NumberFormat('de-DE').format(amtVal + weekOne))
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, '')) + Number(weekFiveAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.amt-week-2').change(function(e){
    let table = $(this).closest('.table')
    let amtVal = Number( $(this).val().replace(/\./g, '') )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekFive = Number( table.find('.week-five').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let weekFiveAdj = table.find('.week-five-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.pct-week-two').val( 0 )
    weekTwoAdj.text(Intl.NumberFormat('de-DE').format(amtVal + weekTwo))
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, '')) + Number(weekFiveAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.amt-week-3').change(function(e){
    let table = $(this).closest('.table')
    let amtVal = Number( $(this).val().replace(/\./g, '') )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekFive = Number( table.find('.week-five').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let weekFiveAdj = table.find('.week-five-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.pct-week-three').val( 0 )
    weekThreeAdj.text(Intl.NumberFormat('de-DE').format(amtVal + weekThree))
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, '')) + Number(weekFiveAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.amt-week-4').change(function(e){
    let table = $(this).closest('.table')
    let amtVal = Number( $(this).val().replace(/\./g, '') )
    console.log( $(this).val().replace(/\./g, '') );
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekFive = Number( table.find('.week-five').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let weekFiveAdj = table.find('.week-five-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.pct-week-four').val( 0 )
    weekFourAdj.text(Intl.NumberFormat('de-DE').format(amtVal + weekFour))
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, '')) + Number(weekFiveAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.amt-week-5').change(function(e){
    let table = $(this).closest('.table')
    let amtVal = Number( $(this).val().replace(/\./g, '') )
    console.log( $(this).val().replace(/\./g, '') );
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekFive = Number( table.find('.week-five').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let weekFiveAdj = table.find('.week-five-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.pct-week-four').val( 0 )
    weekFourAdj.text(Intl.NumberFormat('de-DE').format(amtVal + weekFive))
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, '')) + Number(weekFiveAdj.text().replace(/\./g, ''))
      )
    )
  })

})( jQuery )
