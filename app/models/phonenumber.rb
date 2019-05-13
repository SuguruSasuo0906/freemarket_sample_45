class Phonenumber < ApplicationRecord
    belongs_to :user

    require 'twilio-ruby'

    VERIFICATION_CODE_LENGRH = 6

    attr_accessor :verification_code_confirmation

    validates :number, presence: true,format: { with:  /\A0[5789]0[-(]?\d{4}[-)]?\d{4}\z/} ,allow_blank: true

    after_create :issue_verification_code
    after_create :send_verification_code

    scope :note_verified, ->{where(verified: false)}

    def verify_and_save(attributes)
        if self.verification_code == self.verification_code_confirmation
            self.verified = true
            self.verification_code = nil
            self.save
        else
            self.errors.add(:verification_code_confirmation)
            false
        end
    end

    private

    def issue_verification_code
        self.verification_code = VERIFICATION_CODE_LENGRH.times.map{
            Random.rand(9) +1
        }.join
        self.save!
    end

    def send_verification_code
        twilio_client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: formatted_number,
            body: "この認証コードを入力してください。\n#{verification_code}"
        )
    end

    def twilio_client
        @twilio_client ||=::Twilio::REST::Client.new ENV['TWILIO_SID'],ENV['TWILIO_TOKEN']
    end

    #080-1234-5678 => +8180-1234-5678
    def formatted_number
        "+81#{self.number[1..-1]}"
    end

end
