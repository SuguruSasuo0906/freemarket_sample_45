class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @image = @item.images
    @address = Address.find_by(user_id: current_user.id)

    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    creditcard = Creditcard.find_by(user_id: current_user.id)
    customer = Payjp::Customer.retrieve(creditcard.customer_id)
    @card_information = customer.cards.retrieve(creditcard.card_id)
  end

  def create
    @item = Item.find(params[:item_id])
    creditcard = Creditcard.find_by(user_id: current_user.id)

    if @item.item_sold_id == 1
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer_id = creditcard.customer_id
      Payjp::Charge.create(currency:'jpy',amount: @item.price,customer: customer_id)
      
      Trade.create(item_id: @item.id, seller_id: @item.user_id, buyer_id: current_user.id)
      @item.update(item_sold_id: 4)
      redirect_to root_path

    else
      redirect_to item_buys_path
    end

  end
end
