var nbOfValidAnswers = 0;
var questions = 9


function testFormValidity(e) {
  console.log('inside testFormValidity');
  updateOkClassStatus(e);
};

function updateOkClassStatus(e) {
  if ( testCellValidity($(e.target)) == true ) {
    // greenIt($(this));
    $(e.target).addClass('OK');
    toggleSubmitState('OK');
  } else {
    // redIt($(this));
    $(e.target).removeClass('OK');
    toggleSubmitState('WRONG');
  };
};


function countFieldsOk() {
  return $('.OK').size();
};


function testCellValidity(target) {
  console.log('inside testCellValidity, just focused out of ' + target.attr('id') + ' field');

  var fieldId = target.attr('id');
  console.log('FIELD ID is ' + fieldId);
  switch (fieldId) {
    case 'tos':
      console.log('checkbox is checked ' + target.is(':checked')); //target.attr("checked"));
      if ( target.is(':checked') == true) {
        return true;
      }else{
        return false;
      };
    break;
    default:
      if (target.val() !== '') {
        return true;
      };
      return false;
  }




};


function toggleSubmitState(exitedField) {
  console.log('inside toggleSubmitState');

  if ( exitedField == 'OK' ) {
    console.log('field we exited is OK, nb of OKs = ' + countFieldsOk() );
    if ( countFieldsOk() == questions) {
      console.log('ENABLING BUTTON!!!');
      $('.btn-primary').prop("disabled", false);
    };
  } else { if ( exitedField == 'WRONG' ) {
    console.log('field we exited is WRONG, nb of OKs = ' + countFieldsOk() );
    if ( countFieldsOk() !== questions) {
      console.log('DISABLING BUTTON!!!');
      $('.btn-primary').prop("disabled", true);
    };
  } else {
    console.log('wrong argument for toggleSubmitState');
  };
};
};





// ******** DOCUMENT READY *******




$(document).ready(function() {



  $('input').on('focusout', testFormValidity);
  $('textarea').on('focusout', testFormValidity);
  $('form').on('submit', function() {
    event.preventDefault();
    alert('Form can now be submitted!');

  });


});
