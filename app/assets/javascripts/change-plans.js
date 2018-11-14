  // const form = document.querySelector('.change-plans__form')
  // let weekOne = document.querySelector('.week-one')
  // let weekTwo = document.querySelector('.week-two')
  // let weekThree = document.querySelector('.week-three')
  // let weekFour = document.querySelector('.week-four')
  // let monthAmount = document.querySelector('.month-amount')
  // let weekOneAdj = document.querySelector('.week-one-adj')
  // let weekTwoAdj = document.querySelector('.week-two-adj')
  // let weekThreeAdj = document.querySelector('.week-three-adj')
  // let weekFourAdj = document.querySelector('.week-four-adj')
  // let monthAmountAdj = document.querySelector('.month-amount-adj')
  // let weekOneInitialAmount = Number(weekOne.textContent)
  // console.log(weekOneInitialAmount)
  // const inputPercentage = document.querySelector('.percentage')
  // const inputAmount = document.querySelector('.amount')
  // console.log({inputPercentage, inputAmount})
  //
  // const addAmount = ( sum, initial ) => { return initial + sum }
  //
  // inputPercentage.addEventListener( 'change', ( e ) => {
  //   console.log(e.target);
  //   e.stopPropagation()
  //   inputAmount.value = 0
  //   let pctVal = Number( inputPercentage.value )
  //   let weekOneAmountAdj = Number( weekOneAdj.textContent )
  //   let weekTwoAmountAdj = Number( weekTwoAdj.textContent )
  //   let weekThreeAmountAdj = Number( weekThreeAdj.textContent )
  //   let weekFourAmountAdj = Number( weekFourAdj.textContent )
  //   weekOneAdj.textContent = ( pctVal / 100 ) * 8500 + 8500
  //   weekTwoAdj.textContent = ( pctVal / 100 ) * 8500 + 8500
  //   weekThreeAdj.textContent = ( pctVal / 100 ) * 8500 + 8500
  //   weekFourAdj.textContent = ( pctVal / 100 ) * 8500 + 8500
  //   monthAmountAdj.textContent = weekOneAmountAdj + weekTwoAmountAdj + weekThreeAmountAdj + weekFourAmountAdj
  // }, true )
  //
  // inputAmount.addEventListener( 'change', ( e ) => {
  //   e.stopPropagation()
  //   inputPercentage.value = 0
  //   let sumVal = Number( inputAmount.value )
  //   let weekOneAmountAdj = Number( weekOneAdj.textContent )
  //   let weekTwoAmountAdj = Number( weekTwoAdj.textContent )
  //   let weekThreeAmountAdj = Number( weekThreeAdj.textContent )
  //   let weekFourAmountAdj = Number( weekFourAdj.textContent )
  //   weekOneAdj.textContent = sumVal + 8500
  //   weekTwoAdj.textContent = sumVal + 8500
  //   weekThreeAdj.textContent = sumVal + 8500
  //   weekFourAdj.textContent = sumVal + 8500
  //   monthAmountAdj.textContent = weekOneAmountAdj + weekTwoAmountAdj + weekThreeAmountAdj + weekFourAmountAdj
  // }, true )
  //
  // console.log({inputPercentage, inputAmount, weekOneInitialAmount})

(function($){

  $('.percentage').change(function(e){
    let table = $(this).closest('.table')
    let pctVal = Number( $(this).val() )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.amount').val(0)
    weekOneAdj.text( ( pctVal / 100 ) * 8500 + 8500 )
    weekTwoAdj.text( ( pctVal / 100 ) * 8500 + 8500 )
    weekThreeAdj.text( ( pctVal / 100 ) * 8500 + 8500 )
    weekFourAdj.text( ( pctVal / 100 ) * 8500 + 8500 )
    monthAmountAdj.text( Number(weekOneAdj.text()) + Number(weekTwoAdj.text()) + Number(weekThreeAdj.text()) + Number(weekFourAdj.text()) )
  })

  $('.amount').change(function(e){
    let table = $(this).closest('.table')
    let sumVal = Number( $(this).val() )
    let weekOneAdj = table.find('.week-one-adj')
    let weekTwoAdj = table.find('.week-two-adj')
    let weekThreeAdj = table.find('.week-three-adj')
    let weekFourAdj = table.find('.week-four-adj')
    let monthAmountAdj = table.find('.month-amount-adj')
    table.find('.percentage').val( 0 )
    weekOneAdj.text(sumVal + 8500)
    weekTwoAdj.text(sumVal + 8500)
    weekThreeAdj.text(sumVal + 8500)
    weekFourAdj.text(sumVal + 8500)
    monthAmountAdj.text( Number(weekOneAdj.text()) + Number(weekTwoAdj.text()) + Number(weekThreeAdj.text()) + Number(weekFourAdj.text()) )
  })

})( jQuery )
