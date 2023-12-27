class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_sold, only: [:index, :create]
  before_action :redirect_if_seller, only: [:index, :create]

  def index
    @order = Order.new
  end


  def create
    @order = Order.new(order_params)
    if @order.valid? && pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end
  

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_sold
    redirect_to root_path if @item.purchase.present?
  end

  def redirect_if_seller
    redirect_to root_path if current_user == @item.user
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    begin
      charge = Payjp::Charge.create(
        amount: @item.item_price,
        card: order_params[:token],
        currency: 'jpy'
      )
    rescue Payjp::PayjpError => e
      @order.errors.add(:base, "支払い処理中にエラーが発生しました")
      return false
    end
    true
  end

  def order_params
      params.require(:order).permit(:post_code, :shipping_area_id, :municipality, :street_address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end