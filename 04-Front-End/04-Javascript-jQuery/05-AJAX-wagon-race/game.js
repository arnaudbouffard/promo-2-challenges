var gameIsOn = false;
var startTime;
var apiUrl = 'http://wagon-race-api.herokuapp.com/';
var session_id;
var player1Key = 65;
var player2Key = 80;
var currentGame;


function ajaxGetRequest() {
  $.get( apiUrl + '/game/session/new', function( data ) {
    console.log(data['session_id']);
    session_id = data['session_id'];    //ou data.session_id
  });
};

function ajaxPostNamesAndStartGame(names) {
  $.ajax({        // THIS PART OF API DOES NOT WORK, MY JOB IS DONE
      type: "POST",
      url: apiUrl + 'game/session/' + session_id + "/new",
      contentType: "application/json",
      data: JSON.stringify(names)
    })
      .done(function(data) {
        console.log(data.game.id);
        currentGame = data.game.id;
        switchToGame();
        startTime = new Date;
        gameIsOn = true;
    });
};


function switchToStartButton () {
  $('#startbutton').show();
  $('#form').hide();
  $('#game').hide();
};

function switchToForm () {
  $('#startbutton').hide();
  $('#form').show();
  $('#game').hide();
  $('#results').hide();
};

function switchToGame () {
  $('#startbutton').hide();
  $('#form').hide();
  $('#game').show();
};

function displayResults (digit, t) {

  $('#game').hide();
  var winnerName = $('#plyr' + digit + 'input').val();
  $('#results').show().text(winnerName + ' won in ' + t + ' !');
  };

function movePlayer(player) {
  var positionPlayerMovedTo = $('#' + player + '_race' + ' .currentposition').index() + 1;
  $('#' + player + '_race' + ' .currentposition').removeClass('currentposition').next().addClass('currentposition');

  if (positionPlayerMovedTo == $('.finish').index()) {
    return true;
  };
};

function calculateGameTime(start, end) {
  return (end-start)/1000;
};

function ajaxPostResults(time, winner) {
  console.log(time + ' seconds');
  console.log('player nb ' + winner + ' won');
};

function resetGameBoard() {
  $('td').removeClass('currentposition');
  $('td.start').addClass('currentposition');
};

function displayNames() {
  $('#player1name').text($("#plyr1input").val());
  $('#player2name').text($("#plyr2input").val());
};

function bindKeypresses() {
  $('body').on('keyup', onKeyUp);
};

function onKeyUp(e) {
  if (!gameIsOn) {
    return;
  }
  var which = e.which;
  switch (which) {
    case player1Key:
    validKeyPressed(1);
    break;
    case player2Key:
    validKeyPressed(2);
    break;
    default:
  }
}

function validKeyPressed(nb) {
  var moveEndedUpInWin = movePlayer('player' + nb);
  if (moveEndedUpInWin == true) {
    endGame(nb);
  }
};


function endGame(nb) {
  gameIsOn = false;
  var endTime = new Date;
  var gameTime = calculateGameTime(startTime, endTime);
  ajaxPostResults(gameTime, nb);
  displayResults(nb, gameTime);
  switchToStartButton();
  };

// ********************************DOCUMENT READY*****************************


$(document).ready(function() {
  bindKeypresses();
  ajaxGetRequest();
  switchToStartButton();

  $('#startbutton').submit(function(event) {
    event.preventDefault();
    switchToForm();
    $('#form').submit(function(event) {
      event.preventDefault();
      var plyer1name = $('#plyr1input').val();
      var plyer2name = $('#plyr2input').val();

      displayNames();
      resetGameBoard();

      ajaxPostNamesAndStartGame({
        players: [
        { name: plyer1name },
        { name: plyer2name }
        ]
      });

    });
  });
}
);
