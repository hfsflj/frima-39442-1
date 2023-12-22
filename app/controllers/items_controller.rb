class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]

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

  def show
    redirect_to root_path, alert: "商品が見つかりません。" if @item.nil?
  end

  def edit
      redirect_to root_path and return unless current_user.id == @item.user_id
    
      #if @item.sold_out?
        redirect_to root_path and return
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '商品の情報が更新されました'
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :item_name, :item_detail, :category_id, :item_price, 
      :item_condition_id, :delivery_price_id, :delivery_date_id, 
      :shipping_area_id, :item_image
    )
  end
end