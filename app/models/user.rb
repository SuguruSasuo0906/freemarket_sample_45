class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :nickname, presence: true
  validates :password, presence: true,length:{minimum:6,maximum:128,message:"を6文字以上１２８以下にしてください。",allow_blank: true}
  validates :email, presence: true,uniqueness: { message: "に誤りがあります。ご確認いただき、正しく変更してください。" ,allow_blank: true},format: { with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*[a-zA-Z]+\z/, allow_blank: true }

  has_one :address
  has_one :phonenumber

  belongs_to :item
  
  has_many :todos
  has_many :sales
  has_many :sale_hists
  has_many :exhibits
  has_many :transfer_appli_hists
  has_many :comments
  has_many :purchaseis
  has_many :evaluations
  has_many :transactions

  attr_writer :first_name,:first_name_kana,:last_name,:last_name_kana

  validates :first_name, presence: true
  validates :first_name_kana, presence: true,format:{with:/\A[ア-ン]+\z/,allow_blank: true}
  validates :last_name, presence: true
  validates :last_name_kana, presence: true,format: {with:/\A[ア-ン]+\z/,allow_blank: true}

  before_validation :set_name
  before_validation :set_name_kana

  def last_name
    @last_name || self.name.split(" ").first if self.name.present?
  end

  def first_name
    @first_name || self.name.split(" ").last if self.name.present?
  end

  def set_name
    self.name = [@last_name, @first_name].join(" ")
  end

  def last_name_kana
    @last_name_kana || self.name.split(" ").first if self.namekana.present?
  end

  def first_name_kana
    @first_name_kana || self.name.split(" ").last if self.namekana.present?
  end

  def set_name_kana
    self.namekana = [@last_name_kana, @first_name_kana].join(" ")
  end

  def self.from_omniauth(auth)
    @user = User.where(uid: auth.uid, provider: auth.provider).first

    unless @user
      @user = User.new(
        uid: auth.uid,
        provider: auth.provider,
        email: auth.info.email,
        # name: auth.info.name,
        password: Devise.friendly_token[0, 20],
        # image: auth.info.image
      )
      @user.save(validate: false)
    end
    @user
  end

end
