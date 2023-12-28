class Order 
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post_code, :shipping_area_id, :municipality, :street_address, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :user_id, presence: { message: "can't be blank" }
    validates :item_id, presence: { message: "can't be blank" }
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid" }
    validates :shipping_area_id, numericality: { other_than: 1, message: "must be other than ---" }
    validates :municipality, presence: { message: "can't be blank" }
    validates :street_address, presence: { message: "can't be blank" }
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid" }
    validates :token, presence: { message: "can't be blank" }
  end
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(purchase_id: purchase.id, post_code: post_code, shipping_area_id: shipping_area_id, municipality: municipality, street_address: street_address, building_name: building_name, telephone_number: telephone_number)
  end
end
