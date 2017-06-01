function total(){
  const budget   = parseInt($('.budget-widget').find('#budget').text().slice(17));
  const expenses = parseInt($('.budget-widget').find('#expenses').text().slice(17));
  return budget - expenses
}

function calculateRemainingBudget(){
  const differential = $('.budget-widget').find('.budget-expense-diff').text() + "" + total() + " dollars"
  $('.budget-widget').find('.budget-expense-diff').text(differential)
  if(total() < 0){
    $('.budget-widget').find('.budget-expense-diff').addClass('negative')
  } else {
    $('.budget-widget').find('.budget-expense-diff').addClass('positive')
  }
}

$(document).ready(function(){
  calculateRemainingBudget();
})