var gameIsOn = false;
var startTime = new Date;

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
  $('#results').hide();
};

function displayResults (winner) {
  $('#startbutton').hide();
  $('#form').hide();
  $('#game').hide();
  $('#results').show().text(winner);
};

function movePlayer(player) {
  // var raceId = '#' + player + '_race';
  // var currentTd = $('#' + player + '_race' + ' .currentposition');
  var positionPlayerMovedTo = $('#' + player + '_race' + ' .currentposition').index() + 1;
  $('#' + player + '_race' + ' .currentposition').removeClass('currentposition').next().addClass('currentposition');

  if (positionPlayerMovedTo == $('.finish').index()) {
    return true;
  };
};

function calculateGameTime(start, end) {
  return (end-start)/1000;
};

function postAjax(gameTime, winner) {
  // AJAX <-- game time
  console.log(gameTime + ' seconds');
  // AJAX <-- winner
  console.log(winner);
};

function setGameBoard() {
  $('td').removeClass('currentposition');
  $('td.start').addClass('currentposition');
};

function displayNames() {
  $('#player1name').text($("#plyr1input").val());
  $('#player2name').text($("#plyr2input").val());
};

function listenToKeypresses() {
  $('body').on('keyup', onKeyUp);
};

function onKeyUp(e) {
  if (!gameIsOn) {
    return;  // Nothing to do here
  }
  var which = e.which;
  switch (which) {
    case 65:
    validKeyPressed(1);
    break;
    case 80:
    validKeyPressed(2);
    break;
    default:
  }
}

function validKeyPressed(nb) {
  var moveEndedUpInWin = movePlayer('player' + nb);
  if (moveEndedUpInWin == true) {
    gameIsOn = false;
    var endTime = new Date;
    postAjax(calculateGameTime(startTime, endTime), nb);
    displayResults(nb);
    switchToStartButton();
  }
};


// ********************************DOCUMENT READY*****************************


$(document).ready(function() {
  listenToKeypresses();
  switchToStartButton();

  $('#startbutton').submit(function(event) {
    switchToForm();
    $('#form').submit(function(event) {
      displayNames();
      setGameBoard();
      switchToGame();
      startTime = new Date;
      gameIsOn = true;
      event.preventDefault();
    });
    event.preventDefault();
  });
}
);
