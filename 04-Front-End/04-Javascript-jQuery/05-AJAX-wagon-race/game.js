$(document).ready(function() {

var gameIsOn = false;
console.log(gameIsOn);
$('.game_wrapper').hide();
$('#getnames').hide();

 var movePlayer = function(player) {
  var raceId = '#' + player + '_race';
  var currentTd = $(raceId + ' .active');
  currentTd.removeClass('active').next().addClass('active');
  return gameIsOn = (currentTd.index() < $('.finish').index()-1);
};

var endSession = function() {
  var endTime = new Date;
  // AJAX <-- game time
  console.log((endTime-startTime)/1000 + ' seconds');
  // AJAX <-- winner
  console.log(winner);

  $("#getnames input:nth-child(1)").val("name of 1st player");
  $("#getnames input:nth-child(2)").val("name of 2nd player");

  $('.game_wrapper').hide();
  $('#sessionclosed').show();
  // closeSession()
};



var startSession = function() {
  $('td').removeClass('active');
  $('td.start').addClass('active');
  $('#sessionclosed').hide();
  winner = '';
  gameIsOn = true;
  player1Name = 'no name for player1';
  player2Name = 'no name for player2';
  $('#getnames').show();
};


$('#sessionclosed').submit(function(event) {
  startSession();
  console.log(gameIsOn);
  event.preventDefault();
});

  $('#getnames').submit(function(event) {
    if (($("#getnames input:nth-child(1)").val() !== "name of 1st player") && ($("#getnames input:nth-child(2)").val() !== "name of 2nd player")) {
      player1Name = $("#getnames input:nth-child(1)").val();
      $('.player1name').text(player1Name);
      player2Name = $("#getnames input:nth-child(2)").val();
      $('.player2name').text(player2Name);
      console.log(gameIsOn);
      $('.game_wrapper').show();
      $('#getnames').hide();
      startTime = new Date;
      $('body').keyup(function(e) {
        var which = e.which;
        if (gameIsOn == true) {
          console.log(gameIsOn);
          switch (which) {
            case 65:
            winner = player1Name + ' won.'
            gameIsOn = movePlayer('player1');
            break;

            case 80:
            winner = player2Name + ' won.'
            gameIsOn = movePlayer('player2');
            break;

            default:
            console.log("Wrong key pressed.");
          }
        };
        console.log(gameIsOn);
        if (gameIsOn == false) {
          console.log('plr1' + ($("#getnames input:nth-child(1)").val() !== "name of 1st player"));
          console.log('plr2' + ($("#getnames input:nth-child(2)").val() !== "name of 2nd player"));
          console.log(($("#getnames input:nth-child(2)").val() !== "name of 2nd player") && ($("#getnames input:nth-child(1)").val() !== "name of 1st player"))
          endSession();
          console.log('plr1' + ($("#getnames input:nth-child(1)").val() !== "name of 1st player"));
          console.log('plr2' + ($("#getnames input:nth-child(2)").val() !== "name of 2nd player"));
          console.log(($("#getnames input:nth-child(2)").val() !== "name of 2nd player") && ($("#getnames input:nth-child(1)").val() !== "name of 1st player"))

             // && ($("#getnames input:nth-child(2)").val() !== "name of 2nd player")));
          console.log(gameIsOn);
        };
      });

    }
    event.preventDefault();
  });
});
