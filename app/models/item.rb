class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images
  belongs_to :brand
  belongs_to :category
  belongs_to :item_sold
  belongs_to :item_state
  belongs_to :prefecture
  belongs_to :user
  def self.set_index(id)
    Item.where(id).limit(4).order("created_at DESC")
  end
end
