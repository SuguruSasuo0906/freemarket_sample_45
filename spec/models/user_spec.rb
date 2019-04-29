require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a password" do
     user = User.new(nickname: "1111111", email: "kkk@gmail.com", password: "00000001", password_confirmation: "00000000",last_name:"太郎",first_name:"山田",last_name_kana:"たろう",first_name_kana:"やまだ",year:"1982",month:"10",day:"21")
     user.valid?
     expect(user.errors[:password]).to include("can't be blank")
    end
  end
end