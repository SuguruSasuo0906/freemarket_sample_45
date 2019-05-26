class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @item = Item.new
    @item.images.build

    @category = Category.eager_load(children: :children).where(parent_id: nil)  
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      image_params[:images].each do |image|
        item_image = @item.images.new(image: image)
        item_image.save
      end
      respond to do |format|
        format.html {redirect_to root_path}
        format.json {render :new}
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description,:feewho,:shipment_day,:delivery,:size,:price,:prefecture_id,:brand_id,:category_id,:item_sold_id ,:item_state_id,:bland_id).merge(user_id: current_user.id)
  end

  def image_params
    params.require(:images).permit({image:[]})
  end
end
