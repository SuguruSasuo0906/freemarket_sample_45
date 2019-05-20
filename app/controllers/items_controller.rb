class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @item = Item.new
    @image = image.new
  end

#   def create
#     @item = Item.new(item_params)
#     @image = Image.new(image_params)
#     respond_to do |format|
#       if @item.save && @image.save
#         format.json{}
#       end
#     end
#   end

#   private

#   def item_params
#     params.require(:item).permit(:name,:).merge(user_id: current_user.id)
#   end
# end
