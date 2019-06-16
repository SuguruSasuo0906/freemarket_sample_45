class BuysController < ApplicationController
  before_action :set_item, only:[:index,:create]


  def index

    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(current_user.creditcard.customer_id)
    @card_information = customer.cards.retrieve(current_user.creditcard.card_id)
  end

  def create

    if @item.item_sold_id == 1
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer_id = current_user.creditcard.customer_id
      Payjp::Charge.create(currency:'jpy',amount: @item.price,customer: customer_id)
      
      Trade.create(item_id: @item.id, seller_id: @item.user_id, buyer_id: current_user.id)
      @item.update(item_sold_id: 4)
      redirect_to root_path

    else
      redirect_to item_buys_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
