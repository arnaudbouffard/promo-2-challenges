/*
  *
  * TODO: add your code here!
  *
*/
$(document).ready(function(){
  // $('#message')
  //   .animate({ top: '-=70'},0);
  //   .delay(500).animate({ top: '+=70'},1000);
  //   .on('click', function(e) {
  //     $(this).animate({ top: '-=70'},1000);
  //   });

  $('#message-wrapper')
    .on(mouseenter, function() {
      $('#message').slideDown();
    });
    .on(mouseleave, function() {
      $('#message').slideUp();
    });
}):
