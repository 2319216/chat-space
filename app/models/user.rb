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

  scope :search_by_name, ->(keyword, current_user){ where('name LIKE(?)', "%#{keyword}%").where.not(id: current_user.id) }
end
