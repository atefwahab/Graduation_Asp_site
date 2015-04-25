$(window).scroll(function() {
  if ($(document).scrollTop() > 85) {
    $('nav').addClass('mainrownew');
  } else {
    $('nav').removeClass('mainrownew');
  }
});