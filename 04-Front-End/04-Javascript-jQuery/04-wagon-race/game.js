$(document).ready(function() {
  movePlayer = function(player) {
    var raceId = '#' + player + '_race';
    console.log(raceId);

    var currentTd = $(raceId + ' .active');
    console.log('current TD = ' +currentTd.index());

    currentTd.removeClass('active');

    var nextPos = (currentTd.index()+2).toString();
    console.log('next Pos = ' +nextPos);
    var newSelector = raceId + ' td:nth-child(' + nextPos + ')';
    console.log(newSelector);
    $(newSelector).addClass('active');
  // console.log($(raceId + ' td:nth-child(' + nextPos + ')'));
};

$(document).on('keyup', function(event) {
    // Detect which key was pressed and call the appropriate function
    // Google "jquery keyup what key was pressed" if you don't know how
  });


$('body').keyup(function(e) {
  // console.log( "Handler for .keypress() called." );
  // console.log(which(event));
    var which = e.which;
    // if(which == 65) {
    //   movePlayer('player1');
    // }
    switch (which) {
    case 65:
      movePlayer('player1');
      break;
    case 80:
      movePlayer('player2');
      break;
    default:
      console.log("Top/bottom player PRESS A/P key.");
}
 });

});
