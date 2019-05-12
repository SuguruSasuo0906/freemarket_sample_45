class PhoneNumbersController < ApplicationController
    def new
        @phonenumber=Phonenumber.new
    end

    def create
        @phonenumber = Phonenumber.new(phonenumber_params)
        if @phonenumber.save
            redirect_to new_address_path
        else
            render :new
        end
    end

    private
    def phonenumber_params
        params.require(:phonenumber).permit(:number).merge(user_id: current_user.id)
    end

end
