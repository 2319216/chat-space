$(function(){
  function buildHTML(message){
    var html = `
      <li class="chat-main__message">
        <p class="chat-main__message-name">${message.user_name}</p>
        <p class="chat-main__message-time">${message.time}</p>
        <p class="chat-main__message-body">${message.message}</p>
      </li>
    `
    return html;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.chat-main__body').append(html)
      $('.chat-main__message-send').val('')
      $("#message_image").val("")
      $('.chat-main__body').animate({scrollTop: $('.chat-main__body')[0].scrollHeight});
    })
    .fail(function(){
      alert('error');
    })
    return false
  });

  setInterval(reload, 5000)
  function reload(){
    var current_url = document.location.pathname;
    $.ajax({
      type: 'GET',
      url: current_url,
      dataType: 'json'
    })
    .done(function(messages){
      var message_size = $('.chat-main__body--messages-list ul li').length;
      if (message_size !== messages.length){
        messages.forEach(function(message){
        html = buildHTML(message);
      });
      $('.chat-main__message-ul').append(html);
      $('.chat-main__body').animate({scrollTop: $('.chat-main__body')[0].scrollHeight});
      }
    })
  }
});
