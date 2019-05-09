class PhoneNumbersController < ApplicationController
    def new
        @phone_number=Phonenumber.new
    end

    def create
        @phone_number=Phonenumber.new(phone_number_params)
        if @phone_number.save
            redirect_to new_address_path(@user)
        else
            render :new
        end
    end

    private
    def phone_number_params
        params.require(:phone_number).permit(:phone_number).merge(user_id:current_user.id)
    end

end
