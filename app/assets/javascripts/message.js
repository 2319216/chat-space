$(function(){
  function buildHTML(message){
    var addImage  = (message.image !== null) ? `<img src=${message.image.url}>` : ``;
    var html = `
    <ul>
      <li class="chat-main__message">
        <p class="chat-main__message-name">${message.user_name}</p>
        <p class="chat-main__message-time">${message.time}</p>
        <p class="chat-main__message-body">${message.message}
                                           ${addImage}</p>
      </li>
    </ul>
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
      $('.chat-main__body').animate({scrollTop: $('.chat-main__body')[0].scrollHeight});
    })
    .fail(function(){
      alert('error');
    })
    return false
  })
});
