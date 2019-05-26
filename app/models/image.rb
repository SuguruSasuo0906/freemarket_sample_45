class Image < ApplicationRecord
  has_one :item
  mount_uploader :image, ImageUploader
end
