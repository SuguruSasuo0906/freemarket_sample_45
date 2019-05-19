class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(image: params[:image])
    respond_to do |format|
      if @item.save
        format.json{}
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
