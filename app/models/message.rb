class Message < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :message_or_image, presence: true

  belongs_to :user
  belongs_to :group

  private
    def message_or_image
      message.present? || image.present?
    end

end
