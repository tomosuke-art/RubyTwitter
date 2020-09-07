class Tweet < ApplicationRecord
  belongs_to :user #アソシエーション（1対多）
  mount_uploader :image, ImageUploader
end
