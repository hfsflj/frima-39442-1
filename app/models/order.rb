class Order 
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post_code, :shipping_area_id, :municipality, :street_address, :building_name, :telephone_number, :token

  validates :post_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :shipping_area_id, presence: true, numericality: { other_than: 0 }
  validates :municipality, presence: true
  validates :street_address, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :token, presence: true

  def save
    return false unless valid?

    ActiveRecord::Base.transaction do
      order_record = OrderRecord.create(user_id: user_id, item_id: item_id)
      ShippingAddress.create(order_id: order_record.id, post_code: post_code, shipping_area_id: shipping_area_id, municipality: municipality, street_address: street_address, building_name: building_name, telephone_number: telephone_number)
    end
  end
end
