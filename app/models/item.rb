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
  has_one :trade
  has_many :likes, dependent: :destroy

  def self.set_index(id)
    Item.where(id).limit(4).order("created_at DESC")
  end

  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  # def self.search_first(search)
  #   if search
  #     Item.where(['name LIKE(?)',"%#{search}%"])
  #   else
  #     Item.all
  #   end
  # end
end
