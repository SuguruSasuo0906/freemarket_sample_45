class ItemsController < ApplicationController

    def new
        @item = Item.new
    end

    def create
        @Item = Item.new({image: params.require(:image)})
    end
end
