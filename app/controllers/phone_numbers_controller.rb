class PhoneNumbersController < ApplicationController
    def new
        @phonenumber=Phonenumber.new
    end

    def create
        @phonenumber = Phonenumber.new(phonenumber_params)
        if @phonenumber.save
            redirect_to verification_code_input_phone_numbers_path(@phonenumber)
        else
            render :new
        end
    end

    def verification_code_input
        @phonenumber = Phonenumber.find(current_user.id)
    end

    def update
        @phonenumber = Phonenumber.find(current_user.id)
        respond_to do |format|
            if @phonenumber.verify_and_save(params[:verification_code_confirmation])
                format.html{redirect_to new_creditcard_path}
            else
                format.html{render action:"verification_code_input"}
            end
        end
    end

    private
    def phonenumber_params
        params.require(:phonenumber).permit(:number,:verification_code_confirmation).merge(user_id: current_user.id)
    end

end
