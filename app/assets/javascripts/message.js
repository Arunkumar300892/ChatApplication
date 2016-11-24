$(document).ready(function() {

  $('#messages').animate({scrollTop: $('#messages').prop("scrollHeight")}, 500);

  $('#new_message').submit(function(){
    if($('#message_body').val().length < 2) {
      return false
    } else {
      return true
    }
  });

})
