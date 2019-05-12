class Phonenumber < ApplicationRecord
    belongs_to :user

    validates :number,presence: true,uniqueness: true, format: { with:  /\A0[5789]0[-(]?\d{4}[-)]?\d{4}\z/}
end
