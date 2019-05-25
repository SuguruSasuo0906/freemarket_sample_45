class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @item = Item.new
    @bland = Bland.new
    @category = Category.eager_load(children: :children).where(parent_id: nil)  
  end

  def create
    @item = Item.new(item_params)
    @bland = Bland.new(bland_params)
    if @item.save && @bland.save
      image_params[:image].each do |image|
        @item.images.build
        item_image = @item.images.new(image: image)
        item_image.save
      end
      respond_to do |format|
        format.json {render template:"/freemarket_sample"}
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description,:feewho,:shipment_day,:delivery,:size,:price,:user_id,:prefecture_id,:category_id,:item_sold_id ,:item_state_id,:bland_id).merge(user_id: current_user.id)
  end
  def bland_params
    params.require(:bland).permit(bland:[:name])
  end
  def image_params
    params.require(:image).permit(image:[])
  end
end
