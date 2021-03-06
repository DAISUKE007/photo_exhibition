class Photo < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates :title, presence: true

end
