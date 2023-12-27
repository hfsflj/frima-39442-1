class Order 
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post_code, :shipping_area_id, :municipality, :street_address, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :shipping_area_id, numericality: { other_than: 0 }
    validates :municipality
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  def save
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      ShippingAddress.create(purchase_id: purchase.id, post_code: post_code, shipping_area_id: shipping_area_id, municipality: municipality, street_address: street_address, building_name: building_name, telephone_number: telephone_number)
    end
end
#住所と購入記録にデータを保存する・アクセス権限を書く・バリデーションを設定し内容を確認