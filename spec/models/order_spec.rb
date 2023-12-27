require 'rails_helper'

RSpec.describe Order, type: :model do
    before do
      user = FactoryBot.build(:user)
      item = FactoryBot.build(:item)
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id, post_code: '123-4567', shipping_area_id: 1, municipality: '横浜市緑区', street_address: '青山1-1-1', telephone_number: '09012345678', token: 'tok_abcdefghijk00000000000000000')
    end
  
  describe '商品購入' do
    context '購入がうまくいくとき' do
      it '必須項目が全て存在すれば購入できる' do
        expect(@order).to be_valid
      end

      it '建物名が空でも購入できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空だと購入できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号にハイフンがないと購入できない' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end

      it '郵便番号に半角文字が含まれていると購入できない' do
        @order.post_code = 'ﾊﾅｺ'
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code is invalid")
      end

      it '都道府県が空だと購入できない' do
        @order.shipping_area_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '市区町村が空だと購入できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end


      it '番地が空だと購入できない' do
        @order.street_address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @order.telephone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number can't be blank")
      end
      
      it '電話番号に半角文字が含まれていると購入できない' do
        @order.telephone_number = 'ﾊﾅｺ'
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number is invalid")
      end

    end
  end
end
