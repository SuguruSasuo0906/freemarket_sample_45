class Image < ApplicationRecord
  belongs_to :item
  accepts_nested_attributes_for :item
  mount_uploader :data, ImageUploader
end
