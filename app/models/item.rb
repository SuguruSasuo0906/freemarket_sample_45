class Item < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images
  belongs_to :brand
  belongs_to :category
  belongs_to :item_sold
  belongs_to :item_state
  belongs_to :prefecture
  belongs_to :user
  has_many :messages

  def self.set_index(id)
    Item.where(id).limit(4).order("created_at DESC")
  end

  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end
end
