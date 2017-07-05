class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :email, presence: true
<<<<<<< Updated upstream
  validates :password, presence: true, length: { minimum: 8 }
=======
  varidates :password, presence: true, length: { minimum: 8 }
>>>>>>> Stashed changes
end
