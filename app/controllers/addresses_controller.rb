class AddressesController < ApplicationController
    def new
        @address=Address.new
    end

    def create
        @address=Address.create(address_params)
        if @address
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
