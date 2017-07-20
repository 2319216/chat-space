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
      var message_size = $('.chat-main__body--messages-list li').length;
      if (message_size !== messages.length){
        messages.forEach(function(message){
          console.log(message);
        html = buildHTML(message);
      });
      $('.chat-main__body--messages-list').append(html)
      $('.chat-main__body').animate({scrollTop: $('.chat-main__body')[0].scrollHeight});
      }
    })
  }
});













































// $(function flash() {
//   {var html =
//   $('.notification').append(html);
//   $('.notification-alert').fadeIn(500).fadeOut(2000);
//   setTimeout(function(){
//    $('.notification-alert').remove();
//   },2500);
// }
//   return false
// });

// $(function(){
//   function buildHTML(message){
//     var addImage  = (message.image !== null) ? `<img src=${message.image}>` : ``;
//     var html = `
//       <li class="chat-main__message">
//         <p class="chat-main__message-name">${message.user_name}</p>
//         <p class="chat-main__message-time">${message.time}</p>
//         <p class="chat-main__message-body">${message.message}
//                                            ${addImage}</p>
//       </li>
//     `
//     return html;
//   }

//   $('#new_message').on('submit', function(e){
//     e.preventDefault();
//     var formData = new FormData(this);
//     var url = $(this).attr('action');
//     $.ajax({
//       url: url,
//       type: "POST",
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//     .done(function(data){
//       var html = buildHTML(data);
//       $('.chat-main__message-ul').append(html)
//       $('.chat-main__message-send').val('')
//       $("#message_image").val("")
//       $('.chat-main__message-ul').animate({scrollTop: $('.chat-main__message-ul')[0].scrollHeight});
//     })
//     .fail(function(){
//       alert('error');
//     })
//     return false
//   });

//   $(function(){
//     setInterval(update, 5000);
//   });
//   function update(){
//     if($('.chat-main__message-ul')[0]){
//       var message_id = $('.chat-main__message-ul:last').data('id');
//     } else {
//       var message_id = 0
//     }
//     $.ajax({
//       url: window.location.href,
//       type: 'GET',
//       data: {
//         message: { id: message_id }
//       },
//       dataType: 'json'
//     });
//     .always(function(data){
//       $.each(data, function(i, data){
//         var html = buildHTML(data);
//         $('.chat-main__message-ul').append(html);
//         $('.chat-main__body').animate({scrollTop: $('.chat-main__body')[0].scrollHeight});
//       });
//     });
//   }
// });
