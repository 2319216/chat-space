
$(function flash() {
  {var html =
    $('.notification').append(html);
    $('.notification-alert').fadeIn(500).fadeOut(2000); //指定したクラスを0.5秒でfade inさせて、2秒でfade outさせる。
    setTimeout(function(){
     $('.notification-alert').remove();
    },2500); //指定のクラス自体をremoveする。
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('#message_body');
    var message = textField.val();
  $.ajax({
    type: 'POST',
    url: './messages',
    data: {
      message: {
        body: message
      }
    },
    dataType: 'json'
  })
      .done(function(data) {
        var html = buildHTML(data);
        $('.chat-main__body--messages-list').append(html);
        textField.val('');
        $("input").prop("disabled", false)

        var message = buildMessage(data);
        var group_id = ".id-" + data.group_id
        $(group_id).html(message);
        textField.val('');

      .fail(function() {
        alert('error');
      })
    })
    return false
  })
});
