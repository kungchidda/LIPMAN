$( document ).ready( function() {

$(document).keyup(function(e) {
  if (e.keyCode === 27) {
    $('.image__cell:target').find('.expand__close')[0].click();
  }
  if (e.keyCode === 37) {
    $('.image__cell:target').find('.arrow--left')[0].click();
  }
  if (e.keyCode === 39) {
    $('.image__cell:target').find('.arrow--right')[0].click();
  }
});

} );