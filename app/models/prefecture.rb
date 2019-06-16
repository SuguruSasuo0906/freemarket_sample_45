class Prefecture < ApplicationRecord
    belongs_to :address
    has_many :items

end
