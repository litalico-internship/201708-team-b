$(function() {
  function appendMessage(message) {
    var html = buildMessageHtml(message);
    $('.messages_list').append(html);
  }

  function buildMessageHtml(data) {
    var message;

    if (data['sender_id'] == $('.direct_message').data('current')) {
      message = "<li class='my_each_message' style='width: 100%;'>" +
                  "<div class='msj macro'>" +
                    "<div class='message_text text text-l'>" +
                      data['text'] +
                    "</div>" +
                  "</div>" +
                "</li>";
    } else {
      message = "<li class='partner_each_message' style='width: 100%;'>" +
                  "<div class='msj-rta macro'>" +
                    "<div class='message_text text text-r'>" +
                      data['text'] +
                    "</div>" +
                  "</div>" +
                "</li>";
    }
    return message;
  }

  $(document).on('turbolinks:load', function(){
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
              text: inputText
            }
        },
        context: this
      })
      .done(function(data) {
        console.log(data);
        appendMessage(data);
        this.reset();
      });

      return false;
    });
  });
});
