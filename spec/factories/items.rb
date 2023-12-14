FactoryBot.define do
  factory :item do
    item_name { Faker::Commerce.product_name }
    item_detail { Faker::Lorem.paragraph }
    item_price { Faker::Commerce.price(range: 1000..10000).to_i }
    category_id {2}
    item_condition_id {2}
    delivery_price_id {8000}
    delivery_date_id {2}
    shipping_area_id {2}
    item_image{test_image.jpg}
    association :user
  end
end
