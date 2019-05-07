class Address < ApplicationRecord

    belongs_to :user
    has_many :prefecture

    # validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    # validates :prefecture,presence: true
    # validates :city,presence: true
    # validates :block_number,presence: true
    # validates :phone_number,presence: true,uniqueness: true, format: { with:  /\A0[5789]0[-(]?\d{4}[-)]?\d{4}\z/}
end
