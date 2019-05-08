class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name, presence: true
  validates :last_name_kana, presence: true
  validates :password, presence: true,length:{minimum:6,maximum:128}
  validates :email, presence: true

  has_one :address

  has_many :items
  has_many :todos
  has_many :sales
  has_many :sale_hists
  has_many :exhibits
  has_many :transfer_appli_hists
  has_many :comments
  has_many :purchaseis
  has_many :evaluations
  has_many :transactions
end
