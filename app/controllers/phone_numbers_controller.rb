class PhoneNumbersController < ApplicationController
    before_action :move_to_root,unless: :user_signed_in?

    def new
        @phonenumber=Phonenumber.new
    end

    def create
        @phonenumber = Phonenumber.new(phonenumber_params)
        if @phonenumber.save
            redirect_to phone_number_path(@phonenumber)
        else
            render :new
        end
    end

    def show
        @phonenumber = Phonenumber.find(params[:id])
    end

    def update
        @phonenumber = Phonenumber.find(params[:id])
        @verification_code_confirmation = params.permit(phonenumber: :verification_code_confirmation).to_h
        if @phonenumber.verification_code == @verification_code_confirmation[:phonenumber][:verification_code_confirmation]
            @phonenumber.update(verified:"true",verification_code:"nil")
            redirect_to new_address_path(@phonenumber)
        else
            render :show
        end
    end


    private
    def phonenumber_params
        params.require(:phonenumber).permit(:number,:verification_code,:verification_code_confirmation).merge(user_id: current_user.id)
    end

    def move_to_root
        redirect_to root_path
    end

end
