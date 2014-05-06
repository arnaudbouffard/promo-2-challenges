$(document).ready(function() {

 var movePlayer = function(player) {
  var raceId = '#' + player + '_race';
  var currentTd = $(raceId + ' .active');
  currentTd.removeClass('active').next().addClass('active');
  return gameIsOn = (currentTd.index() < 12);
};

var resetGame = function() {
  winner = '';
  $('.results_wrapper').hide();
  $('td').removeClass('active');
  $('td:first-child').addClass('active');
  gameIsOn = true;
};


  $('.game_wrapper').hide();
  var winner = '';
  var gameIsOn = true;



  $('#target').submit(function(event) {
    if ($("input:first").val() === "a") {
      $('.game_wrapper').show();
      $('#target').hide();

      $('body').keyup(function(e) {
        var which = e.which;
        if (gameIsOn == true) {
          switch (which) {
            case 65:
            var player1StillRunning = movePlayer('player1');
            winner = 'Player 1 won.'
            console.log(gameIsOn = player1StillRunning);
            break;
            case 80:
            var player2StillRunning = movePlayer('player2');
            winner = 'Player 2 won.'
            console.log(gameIsOn = player2StillRunning);
            break;
            default:
            console.log("Top/bottom player PRESS A/P key.");
          }
        };
        if (gameIsOn == false) {
          $('.results_wrapper').show().text(winner);
          $(document).click(resetGame);
        };
      });



      // return;
    }
    // $( "span" ).text( "Not valid!" ).show().fadeOut( 1000 );
    event.preventDefault();
  });
});
