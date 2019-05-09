class PhoneNumbersController < ApplicationController
    def new
        @phonenumber=Phonenumber.new
    end

    def create
        @phonenumber=Phonenumber.create(phonenumber_params)
        if @phonenumber
            redirect_to new_address_path(@user)
        else
            render :new
        end
    end

    private
    def phonenumber_params
        params.require(:phonenumber).permit(:phone_number).merge(user_id:current_user.id)
    end

end
