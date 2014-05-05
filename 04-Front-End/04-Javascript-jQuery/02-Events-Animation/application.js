/*
  *
  * TODO: add your code here!
  *
*/
$('#message-wrapper').animate({ top: '-=70'},0);
$('#message-wrapper').delay(500).animate({ top: '+=70'},1000);
$('#message-wrapper').on('click', function(e) {

 $(this).animate({ top: '-=70'},1000);

});
