class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @image = @item.images
    @address = Address.find_by(user_id: current_user.id)
    creditcard = Creditcard.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(creditcard.customer_id)
    @card_information = customer.cards.retrieve(creditcard.card_id)
  end
end
