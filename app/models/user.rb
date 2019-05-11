class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name, presence: true
  validates :last_name_kana, presence: true
  validates :password, presence: true,length:{minimum:6,maximum:128}
  validates :email, presence: true

  has_one :address
  has_one :phonenumber

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end
