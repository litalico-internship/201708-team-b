$(function() {
  function appendMessage(message) {
    var html = buildMessageHtml(message);
    $('.messages_list').append(html);
  }

  function buildMessageHtml(message) {
    var message = "<div class='each_message'><div class='message_text'>" + message['text'] + "</div></div>";
    return message;
  }

  $('#new_direct_message').on('submit', function(ev) {
    ev.preventDefault();
    var $textField = $('#message_field');
    var inputText = $textField.val();

    $.ajax({
      type: 'POST',
      url: './direct_messages',
      dataType: 'json',
      data: {
        direct_message:
          {
            text: inputText,
          }
      },
      context: this
    })
    .done(function(data) {
      appendMessage(data);
      this.reset();
    });

    return false;
  });
});