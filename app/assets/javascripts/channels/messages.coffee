App.global_chat = App.cable.subscriptions.create 'MessagesChannel',
  received: (data) ->
    $('#messages').load('dynamic_call')
$ ->
  $('#new_message').on
    'ajax:success': ->
      $('#messages').load('dynamic_call')
      $('#message_body').val('')
      $('#messages').animate({scrollTop: $('#messages').prop("scrollHeight")}, 500);
