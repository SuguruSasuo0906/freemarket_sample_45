class AddressesController < ApplicationController
    def new
        @address=Address.new
    end

    def create
        @address=Address.new(address_params)
        if @address.save
            redirect_to root_path
        else
            render :new
        end
    end

    private
    def address_params
        params.require(:address).permit(:phone_number).merge(user_id:current_user.id)
    end
end
