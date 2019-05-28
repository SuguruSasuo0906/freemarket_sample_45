class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @item = Item.new
    @category = Category.eager_load(children: :children).where(parent_id: nil)  
  end

  def create
    @item = Item.new(item_params)
    @item_image = @item.images.build
    binding.pry

    @image = params[:images][:data]
    @image.each do |a|
      @image_data = a.read
      @item_image = @item.images.create!(data: @image_data, item_id: @item.id)
    end
    if @item.save!
      # image_params[:images].each do |image|
      #   item_image = @item.images.new(data: params[image].read)
      #   item_image.save
      # end
      respond_to do |format|
        format.html {redirect_to root_path}
        format.json {render :new}
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description,:feewho,:shipment_day,:delivery,:size,:price,:prefecture_id,:brand_id,:category_id,:item_sold_id ,:item_state_id,:bland_id,images_attributes:[:id,:item_id,:data]).merge(user_id: current_user.id)
  end

  # def image_params
  #   params.require(:images).permit(:data)
  # end
end
