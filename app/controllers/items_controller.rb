class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
    
      if @item.sold_out?
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

  def destroy
    if current_user.id == @item.user_id
      if @item.destroy
        redirect_to root_path, notice: '商品を削除しました'
        else
          redirect_to root_path, alert: '商品の削除に失敗しました'
      end
    else
      redirect_to root_path, alert: '商品の削除に失敗しました'
    end
  end

    def purchase
      if params[:item_id]
      @item = Item.find(params[:id])
    else
      redirect_to root_path, alert: "アイテムが指定されていません。"
      end
    end
  

  private
  
  def set_item
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "指定された商品は存在しません。"
  end

  def item_params
    params.require(:item).permit(
      :item_name, :item_detail, :category_id, :item_price, 
      :item_condition_id, :delivery_price_id, :delivery_date_id, 
      :shipping_area_id, :item_image
    )
  end
end