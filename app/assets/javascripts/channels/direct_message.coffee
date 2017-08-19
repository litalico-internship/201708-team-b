receiver_id = $('#receiver_id').val()
sender_id = $('#sender_id').val()
App.direct_message = App.cable.subscriptions.create { channel: "DirectMessageChannel", receiver_id: receiver_id, sender_id: sender_id },
  console.log('dd')
  connected: ->

  disconnected: ->

  received: (data) ->
    @appendMessage(data)

  appendMessage: (data) ->
    html = @buildMessage(data)
    $('#message_list').append(html)

  buildMessage: (data) ->
    "<div class='each_message'>" + data['message'] + "</div>"

  speak: (text, receiver_id, sender_id) ->
    @perform 'speak', message: { text: text, receiver_id: receiver_id, sender_id: sender_id }

$('#message_index').on 'submit', '[data-behavior~=speak_direct_message_speaker]', (event) ->
  $textField = $('#message_field')
  inputText = $textField.val()
  App.direct_message.speak inputText, receiver_id, sender_id
  $textField.val('')
  event.preventDefault()
