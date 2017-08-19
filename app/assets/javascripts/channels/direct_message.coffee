receiver_id = $('#receiver_id').val()
App.direct_message = App.cable.subscriptions.create { channel: "DirectMessageChannel", receiver_id: receiver_id },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    @appnedMessage(data)

  appendMessage: (data) ->
    html = @buildMessage(data)
    $('#message_list').append(html)

  buildMessage: (data) ->
    "<div class='each_message'>" + data['message']['text'] + "</div>"

  speak: (text) ->
    @perform 'speak', message: text

  build_message_list: ()

$textField = $('#message_field')
inputText = $textField.val()
if inputText
  $('#message_index').on 'click', '[data-behavior~=speak_direct_message_speaker]', (event) ->
    event.preventDefault()
    App.direct_message.speak inputText
    $textField.val('')
