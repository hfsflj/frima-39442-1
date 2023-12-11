class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]  # ログインが必要なアクションを指定

  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to root_path, notice: 'Item was successfully created'

    else
      render :new
    end
  end

  # ... 他のメソッド

  private

  def item_params
    params.require(:item).permit(:item_name, :item_detail, :category_id, :item_price, :item_condition_id, :delivery_price_id, :delivery_date_id, :shipping_area_id, :item_image)
  end
end
