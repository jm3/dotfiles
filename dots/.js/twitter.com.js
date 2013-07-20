setTimeout( function() {

  // hide overly precious logo
  $("i.larry-topbar").hide();

  // hide recommended users:
  $(".js-similar-to-module").hide();

  // hide trends:
  $(".js-trend-location").parent().parent().parent().parent().hide();

  // hide "discover"
  $(".topics").hide();

  // hide "footer" nav (really bottom of sidebar):
  $(".site-footer").hide();

}, 100 );

