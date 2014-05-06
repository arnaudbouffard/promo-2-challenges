$(document).ready(function(){

  $('img').on('click', function(){
      var $overlay = $('<div>').addClass('overlay');
      $body = $('body')
      $overlay.hide().appendTo($body).fadeIn('slow');

      var $photo = $('<img>').attr({
        src: $(this).attr('src')
      });

      var $photoWrapper = $('<div>').addClass('photo-wrapper');
      $photoWrapper.hide().append($photo).appendTo($body).fadeIn('slow');

      $photoWrapper.on('click', function(){
        $photoWrapper.add($overlay).fadeOut('slow',function(){
          $(this).remove();
        });
      })
  });







});
