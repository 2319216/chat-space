class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :email, presence: true
  # validates :encrypted_password, presence: true, length: { minimum: 8 }

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :messages
end

    # / この部分はインクリメンタルサーチ（ユーザー追加の非同期化のときに使用します
    # /
    #   <div class='chat-group-form__field--left'>
    #   <label class="chat-group-form__label" for="chat_group_チャットメンバーを追加">チャットメンバーを追加</label>
    #   </div>
    #   <div class='chat-group-form__field--right'>
    #   <div class='chat-group-form__search clearfix'>
    #   <input class='chat-group-form__input' id='user-search-field' placeholder='追加したいユーザー名を入力してください' type='text'>
    #   </div>
    #   <div id='user-search-result'></div>
    #   </div>

      # / グループ作成機能の追加時はここにcollection_check_boxesの記述を入れてください
      # / この部分はインクリメンタルサーチ（ユーザー追加の非同期化のときに使用します
      # /
      #   <div id='chat-group-users'>
      #   <div class='chat-group-user clearfix' id='chat-group-user-22'>
      #   <input name='chat_group[user_ids][]' type='hidden' value='22'>
      #   <p class='chat-group-user__name'>seo_kyohei</p>
      #   </div>
      #   </div>