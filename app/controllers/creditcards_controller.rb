class CreditcardsController < ApplicationController
  protect_from_forgery except: [:create]
  before_action :redirect_to_root,unless: :user_signed_in?

  require "payjp"

  def new
    creditcard = Creditcard.where(user_id: current_user.id)
    redirect_to action: "show" if creditcard.exists?
  end

  def pay
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: '登録テスト',
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @creditcard = Creditcard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @creditcard.save
        redirect_to sign_up_path(current_user.id)
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete
    creditcard = Creditcard.where(user_id: current_user.id).first
    if creditcard.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(creditcard.customer_id)
      customer.delete
      creditcard.delete
    end
    redirect_to action: "new"
  end

  def show
    creditcard = Creditcard.where(user_id: current_user.id).first
    if creditcard.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(creditcard.customer_id)
      @default_card_information = customer.cards.retrieve(creditcard.card_id)
    end
  end

  private

  def redirect_to_root
    redirect_to root_path
  end
end
