$(document).ready(function() {
  // Deduct body top+bottom margins from window height
  var navMargins = $('body').css('margin').slice(0, 2) * 2;
  var windowHeight = $(window).height() - navMargins;

  // Set title card to full browser height
  $('.title-card').height(windowHeight);

  // Set main content min height to full browser height
  $('#main-content').css('min-height', windowHeight);

  $('.title-card').on('click', '.scroll-button span', function() {
    $('html, body').animate({
      scrollTop: $('#main-content').offset().top
    }, 700);
  });
});
