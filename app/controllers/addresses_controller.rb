class AddressesController < ApplicationController
    def new
        @address=Address.new
    end

    def create
        @address=Address.new(address_params)
        if @address.save
            redirect_to new_address_path(user_id:current_user.id)
        else
            render :new
        end
    end

    private
    def address_params
        params.require(:address).permit(:phone_number,:postal_code,:prefecture,:city,:block_number,:building_name).merge(user_id:current_user.id)
    end
end
