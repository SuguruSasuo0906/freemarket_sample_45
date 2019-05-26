class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images
  belongs_to :brands
  belongs_to :categorie
  belongs_to :item_solds
  belongs_to :item_states
  belongs_to :prefectures
  has_many :users
end
