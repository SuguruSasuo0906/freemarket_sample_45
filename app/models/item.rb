class Item < ApplicationRecord
  has_many :images
  has_many :brands
  has_many :categorie
  has_many :item_solds
  has_many :item_states
  has_many :prefectures
  has_many :users

  def self.set_index(id)
    Item.where(id).order("created_at DESC")
  end
end
