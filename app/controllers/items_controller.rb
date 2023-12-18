class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @item = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.user = current_user
  
    @item.item_image.attach(params[:item][:item_image]) if params[:item][:item_image]
  
    if @item.save
      redirect_to root_path, notice: 'Item was successfully created'
    else
      render :new
    end
  end
  

  private

  def item_params
    params.require(:item).permit(
      :item_name, :item_detail, :category_id, :item_price, 
      :item_condition_id, :delivery_price_id, :delivery_date_id, 
      :shipping_area_id, :item_image
    )
  end
end
