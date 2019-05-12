class AddressesController < ApplicationController
    def new
        @address=Address.new
    end

    def create
        @address=Address.new(address_params)
        if @address.save
            redirect_to new_creditcard_path
        else
            render :new
        end
    end
    
    def update
    end

    private
    def address_params
        params.require(:address).permit(:postal_code,:prefecture_id,:city,:block_number,:building_name,:name,:namekana).merge(user_id:current_user.id)
    end
end
