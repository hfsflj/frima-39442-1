class ShippingAddress < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :shipping_area_id, numericality: { other_than: 1, message: "must be other than ---" }
    validates :municipality
    validates :street_address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "is too short (minimum is 10 characters)" }
  end
end
