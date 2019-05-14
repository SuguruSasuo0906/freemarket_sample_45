class Address < ApplicationRecord

    belongs_to :user
    has_many :prefectures

    validates :name,presence: true
    validates :namekana,presence: true ,format: { with:/\A[ア-ン]+\z/}
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id,presence: true
    validates :city,presence: true
    validates :block_number,presence: true
end
