$(function() {
  function buildUSER(user){
    var html = `
      <li class="chat-group-user clearfix">
        <p class="chat-group-user__name">${user.name}</p>
        <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id=${ user.id } data-user-name=${ user.name }>追加</a>
      </li>
    `
    return html;
  }

  function buildMEMBER(user){
    var user_id = user.attr('data-user-id');
    var user_name = user.attr('data-user-name');
    var html = `
      <li class='chat-group-user clearfix js-chat-member' id='chat-group-user-8'>
        <input name='group[user_ids][]' type='hidden' value=${ user_id }>
        <p class='chat-group-user__name'>${ user_name }</p>
        <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</a>
      </li>
    `
    return html;
  }

  $(document).on('turbolinks:load', function(){
    $(document).on('keyup', '#user-search-field', function(e){
      e.preventDefault();
      var input = $.trim($(this).val());
      $.ajax({
        url: '/users/search',
        type: 'GET',
        data: ('keyword=' + input),
        dataType: 'json'
      })
      .done(function(data){
        $('#result').find('li').remove();
        $(data).each(function(i, user){
          var html = buildUSER(user);
          $('#result').append(html)
        });
      })
      .fail(function(){
        alert('ユーザー検索に失敗しました');
      })
    });
  });

  $(document).on('click', '.chat-group-user__btn--add' ,function(){
    $(this).parent().remove();
    var html = buildMEMBER($(this));
      $('#chat-group-users').append(html)
  })

  $(document).on('click', '.chat-group-user__btn--remove' ,function(){
    $(this).parent().remove();
  })
});

