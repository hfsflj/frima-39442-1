# spec/models/item_spec.rb

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'バリデーション' do
    let(:user) { create(:user) }

    it 'モデルが設定されている場合ばインスタンスが有効であること' do
      item = build(:item, user: user)
      expect(item).to be_valid
    end

    it 'item_nameがない場合は無効であること' do
      item = build(:item, item_name: nil, user: user)
      expect(item).to_not be_valid
    end

    it 'item_detailがない場合は無効であること' do
      item = build(:item, item_detail: nil, user: user)
      expect(item).to_not be_valid
    end

    it 'item_priceがない場合は無効であること' do
      item = build(:item, item_price: nil, user: user)
      expect(item).to_not be_valid
    end

    it 'item_priceが整数でない場合は無効であること' do
      item = build(:item, item_price: 'abc', user: user)
      expect(item).to_not be_valid
    end

    it 'item_priceが負の値の場合は無効であること' do
      item = build(:item, item_price: -1, user: user)
      expect(item).to_not be_valid
    end

    it 'item_condition_idがない場合は無効であること' do
      item = build(:item, item_condition_id: nil, user: user)
      expect(item).to_not be_valid
    end

    it 'delivery_price_idがない場合は無効であること' do
      item = build(:item, delivery_price_id: nil, user: user)
      expect(item).to_not be_valid
    end

    it 'delivery_date_idがない場合は無効であること' do
      item = build(:item, delivery_date_id: nil, user: user)
      expect(item).to_not be_valid
    end

    it 'shipping_area_idがない場合は無効であること' do
      item = build(:item, shipping_area_id: nil, user: user)
      expect(item).to_not be_valid
    end
  end
end