class PhoneNumbersController < ApplicationController
    def new
        @address=Address.new
    end
end
