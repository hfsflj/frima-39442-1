require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'ActiveHash属性のバリデーション' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品ができる時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end

      it 'item_nameが存在すれば保存できること' do
        expect(@item).to be_valid
      end

      it 'item_detailが存在すれば保存できること' do
        expect(@item).to be_valid
      end

      it 'item_priceが存在すれば保存できること' do
        expect(@item).to be_valid
      end

      it 'item_condition_idが存在すれば保存できること' do
        expect(@item).to be_valid
      end

      it 'delivery_price_idが存在すれば保存できること' do
        expect(@item).to be_valid
      end

      it 'delivery_date_idが存在すれば保存できること' do
        expect(@item).to be_valid
      end

      it 'shipping_area_idが存在すれば保存できること' do
        expect(@item).to be_valid
      end

      it 'item_imageが存在すれば保存できること' do
        expect(@item).to be_valid
      end

      it 'userが紐づいていれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'item_nameがない場合は無効であること' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it 'item_detailがない場合は無効であること' do
        @item.item_detail = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item detail can't be blank"
      end

      it 'item_priceが空では保存できないこと' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price can't be blank"
      end
  
      it 'item_priceが半角数字以外では保存できないこと' do
        @item.item_price = '半額'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price is not a number"
      end
  
      it 'item_priceが300未満の値では保存できないこと' do
        @item.item_price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price must be greater than 300"
      end
  
      it 'item_priceが10000000以上の値では保存できないこと' do
        @item.item_price = 10_000_001
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price must be less than 10000000"
      end
  
      it 'item_condition_idが nil 場合は無効であること' do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition can't be blank"
      end
  
      it 'item_condition_idが{---} では保存できないこと' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Item condition must be other than ---"
      end
  
      it 'delivery_date_idが nil では保存できないこと' do
        @item.delivery_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery date can't be blank"
      end
  
      it 'delivery_date_idが {---} では保存できないこと' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery date must be other than ---" 
      end
  
      it 'shipping_area_idが nil では保存できないこと' do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area can't be blank"
      end
  
      it 'shipping_area_idが {---} では保存できないこと' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area must be other than ---"
      end

      it 'item_imageが nil では出品できないこと' do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item image can't be blank"
      end

      it 'userが紐づいていない場合は保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
