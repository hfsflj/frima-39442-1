class ShippingAddresse < ApplicationRecord

  t.string :post_code, null: false
  t.integer :shipping_area_id, null: false
  t.string :municipality, null: false
  t.string :street_address, null: false
  t.string :building_name
  t.string :telephone_number, null: false
  t.references :purchase, null: false,unique: true

  belongs_to :purchase
end
