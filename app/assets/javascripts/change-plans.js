(function($){

  webshim.activeLang('de');
  webshims.setOptions('forms-ext', {
    replaceUI: 'auto',
    types: 'number'
  });
  webshims.polyfill('forms forms-ext');

  $('.pct-week-one').change(function(e){
    let table = $(this).closest('.table')
    table.find('.amt-week-1').val(0)
    let pctVal = Number( $(this).val() )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    weekOneAdj.text( Intl.NumberFormat('de-DE').format(( pctVal / 100 ) * weekOne + weekOne) )
    // weekTwoAdj.text( weekTwo )
    // weekThreeAdj.text( weekThree )
    // weekFourAdj.text( weekFour )
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.pct-week-two').change(function(e){
    let table = $(this).closest('.table')
    table.find('.amt-week-2').val(0)
    let pctVal = Number( $(this).val() )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    // weekOneAdj.text( weekOne )
    weekTwoAdj.text( Intl.NumberFormat('de-DE').format(( pctVal / 100 ) * weekTwo + weekTwo) )
    // weekThreeAdj.text( weekThree )
    // weekFourAdj.text( weekFour )
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.pct-week-three').change(function(e){
    let table = $(this).closest('.table')
    let pctVal = Number( $(this).val() )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.amt-week-3').val(0)
    // weekOneAdj.text( weekOne )
    // weekTwoAdj.text( weekTwo )
    weekThreeAdj.text( Intl.NumberFormat('de-DE').format(( pctVal / 100 ) * weekThree + weekThree) )
    // weekFourAdj.text( weekFour )
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.pct-week-four').change(function(e){
    let table = $(this).closest('.table')
    let pctVal = Number( $(this).val() )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.amt-week-3').val(0)
    // weekOneAdj.text( weekOne )
    // weekTwoAdj.text( weekTwo )
    // weekThreeAdj.text( weekThree )
    weekFourAdj.text( Intl.NumberFormat('de-DE').format(( pctVal / 100 ) * weekFour + weekFour) )
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.amt-week-1').change(function(e){
    let table = $(this).closest('.table')
    let amtVal = Number( $(this).val() )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.pct-week-one').val( 0 )
    weekOneAdj.text(Intl.NumberFormat('de-DE').format(amtVal + weekOne))
    // weekTwoAdj.text(weekTwo)
    // weekThreeAdj.text(weekThree)
    // weekFourAdj.text(weekFour)
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.amt-week-2').change(function(e){
    let table = $(this).closest('.table')
    let amtVal = Number( $(this).val() )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.pct-week-two').val( 0 )
    // weekOneAdj.text(weekOne)
    weekTwoAdj.text(Intl.NumberFormat('de-DE').format(amtVal + weekTwo))
    // weekThreeAdj.text(weekThree)
    // weekFourAdj.text(weekFour)
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.amt-week-3').change(function(e){
    let table = $(this).closest('.table')
    let amtVal = Number( $(this).val() )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.pct-week-three').val( 0 )
    // weekOneAdj.text(weekOne)
    // weekTwoAdj.text(weekTwo)
    weekThreeAdj.text(Intl.NumberFormat('de-DE').format(amtVal + weekThree))
    // weekFourAdj.text(weekFour)
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, ''))
      )
    )
  })

  $('.amt-week-4').change(function(e){
    let table = $(this).closest('.table')
    let amtVal = Number( $(this).val() )
    let weekOne = Number( table.find('.week-one').text().replace(/\./g, '') )
    let weekTwo = Number( table.find('.week-two').text().replace(/\./g, '') )
    let weekThree = Number( table.find('.week-three').text().replace(/\./g, '') )
    let weekFour = Number( table.find('.week-four').text().replace(/\./g, '') )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.pct-week-four').val( 0 )
    // weekOneAdj.text(weekOne)
    // weekTwoAdj.text(weekTwo)
    // weekThreeAdj.text(weekThree)
    weekFourAdj.text(Intl.NumberFormat('de-DE').format(amtVal + weekFour))
    monthAmountAdj.text(
      new Intl.NumberFormat('de-DE').format(
        Number(weekOneAdj.text().replace(/\./g, '')) + Number(weekTwoAdj.text().replace(/\./g, '')) + Number(weekThreeAdj.text().replace(/\./g, '')) + Number(weekFourAdj.text().replace(/\./g, ''))
      )
    )
  })

})( jQuery )
