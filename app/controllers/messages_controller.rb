class MessagesController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @message = @item.messages.new(message_params)
    @message.save!
      respond_to do |format|
        format.json 
        format.html 
      end
  end

  def message_params
    params.require(:message).permit(:comment,:id).merge(item_id: params[:item_id],user_id: current_user.id)
  end

end
