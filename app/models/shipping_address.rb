class ShippingAddress < ApplicationRecord
  belongs_to :purchase

  validates :post_code, presence: { message: "can't be blank" }
  validates :shipping_area_id, presence: { message: "can't be blank" }
  validates :municipality, presence: { message: "can't be blank" }
  validates :street_address, presence: true, presence: { message: "can't be blank" }
  validates :telephone_number, presence: true, presence: { message: "can't be blank" }
end