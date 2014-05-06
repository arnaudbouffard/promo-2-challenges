$(document).ready(function() {

 var movePlayer = function(player) {
  var raceId = '#' + player + '_race';
  var currentTd = $(raceId + ' .active');
  currentTd.removeClass('active').next().addClass('active');
  return gameIsOn = (currentTd.index() < $('.finish').index()-1);
};

var resetGame = function() {
  winner = '';
  $('.reset_indication').css({color: 'black'})
  $('.results_wrapper').hide();
  $('td').removeClass('active');
  $('td.start').addClass('active');
  gameIsOn = true;
};

var startGame = function() {
  $('.game_wrapper').hide();
  winner = '';
  gameIsOn = true;
  player1Name = 'no name for player1';
  player2Name = 'no name for player2';
  player1Score = 0;
  player2Score= 0;
};

// Setting all variables to initial values, starting game

startGame();

  $('#target').submit(function(event) {
    if (($("input:first").val() != "name of 1st player") & ($("input:nth-child(2)").val() != "name of 2nd player")) {
      player1Name = $("input:nth-child(1)").val();
      $('.player1name').text(player1Name);
      player2Name = $("input:nth-child(2)").val();
      $('.player2name').text(player2Name);

      $('.game_wrapper').show();
      $('#target').hide();

      $('body').keyup(function(e) {
        var which = e.which;
        if (gameIsOn == true) {
          switch (which) {
            case 65:
            winner = player1Name + ' won.'
            gameIsOn = movePlayer('player1');
            if (gameIsOn == false){
              $('.player1score').text(player1Score += 1);
            };
            break;

            case 80:

            winner = player2Name + ' won.'
            gameIsOn = movePlayer('player2');
            if (gameIsOn == false){
              $('.player2score').text(player2Score += 1);
            };
            break;

            default:
            console.log("Top/bottom player PRESS A/P key.");
          }
        };
        if (gameIsOn == false) {
          $('.results_wrapper').show().text(winner);
          $('.reset_indication').css({color: 'red'})
          $(document).click(resetGame);
        };
      });

    }
    event.preventDefault();
  });
});
