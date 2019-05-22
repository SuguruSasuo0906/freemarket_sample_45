class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @item = Item.new
    @bland = Bland.new
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      image_params[:image].each do |image|
        @item.images.build
        item_image = @item.images.new(image: image)
        item_image.save
      end
      respond_to do |format|
        format.json
      end
    end
  end

  private

  def create_params
    item_params = params.require(:item).permit(:name,)
    return item_params
  end

  def image_params
    params.require(:images).permit(images:[])
  end
end
