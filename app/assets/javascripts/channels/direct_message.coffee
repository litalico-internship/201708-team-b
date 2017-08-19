receiver_id = $('#receiver_id').val()
sender_id = $('#sender_id').val()
App.direct_message = App.cable.subscriptions.create { channel: "DirectMessageChannel", receiver_id: receiver_id, sender_id: sender_id },
  connected: ->

  disconnected: ->

  received: (data) ->
    @appendMessage(data)

  appendMessage: (data) ->
    html = @buildMessage(data)
    $('#message_list').append(html)

  buildMessage: (data) ->
    "<div class='each_message'>" + data['message']['text'] + "</div>"

  speak: (text) ->
    @perform 'speak', message: text

$('#message_index').on 'submit', '[data-behavior~=speak_direct_message_speaker]', (event) ->
  textField = $('#message_field')
  inputText = $textField.val()
  App.direct_message.speak inputText
  $textField.val('')
  event.preventDefault()
