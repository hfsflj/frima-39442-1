class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPの秘密鍵
    charge = Payjp::Charge.create(
      amount: @item.price, # 金額
      card: order_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )

  end

  def order_params
      params.require(:order).permit(:post_code, :shipping_area_id, :municipality, :street_address, :building_name, :telephone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
