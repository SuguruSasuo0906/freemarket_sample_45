class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images
  has_many :brands
  has_many :categorie
  has_many :item_solds
  has_many :item_states
  has_many :prefectures
  has_many :users
  def self.set_index(id)
    Item.where(id).limit(4).order("created_at DESC")
  end
end
