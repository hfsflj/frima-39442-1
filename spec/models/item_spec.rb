require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { create(:user) }

  context '正常な場合' do
    it '商品を正常に登録できること' do
      item = build(:item, user_id: user.id)
      item.item_image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/jpg')
      expect(item).to be_valid
    end
  end
    
  context '異常な場合' do
    it 'item_nameがない場合は無効であること' do
      item = build(:item, item_name: nil, user_id: user.id)
      expect(item).to_not be_valid
    end

    it 'item_detailがない場合は無効であること' do
      item = build(:item, item_detail: nil, user_id: user.id)
      expect(item).to_not be_valid
    end

    it 'item_priceがない場合は無効であること' do
      item = build(:item, item_price: nil, user_id: user.id)
      expect(item).to_not be_valid
    end

    it 'item_priceが整数でない場合は無効であること' do
      item = build(:item, item_price: 'abc', user_id: user.id)
      expect(item).to_not be_valid
    end

    it 'item_priceが負の値の場合は無効であること' do
      item = build(:item, item_price: -1, user_id: user.id)
      expect(item).to_not be_valid
    end

    it 'item_condition_idがない場合は無効であること' do
      item = build(:item, item_condition_id: nil, user_id: user.id)
      expect(item).to_not be_valid
    end

    it 'delivery_price_idがない場合は無効であること' do
      item = build(:item, delivery_price_id: nil, user_id: user.id)
      expect(item).to_not be_valid
    end

    it 'delivery_date_idがない場合は無効であること' do
      item = build(:item, delivery_date_id: nil, user_id: user.id)
      expect(item).to_not be_valid
    end

    it 'shipping_area_idがない場合は無効であること' do
      item = build(:item, shipping_area_id: nil, user_id: user.id)
      expect(item).to_not be_valid
    end

    it '画像がからでは出品できないこと' do
      item = build(:item, item_image: nil, user_id: user.id)
      expect(item).to_not be_valid
    end
  end
end
