class Message < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :message, presence: true

  belongs_to :user
  belongs_to :group

end
