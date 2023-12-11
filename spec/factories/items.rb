FactoryBot.define do
  factory :item do
    item_name { Faker::Commerce.product_name }
    item_detail { Faker::Lorem.paragraph }
    item_price { Faker::Commerce.price(range: 1000..10000).to_i }
    category_id { FactoryBot.create(:category).id }
    item_condition_id { FactoryBot.create(:item_condition).id }
    delivery_price_id { FactoryBot.create(:delivery_price).id }
    delivery_date_id { FactoryBot.create(:delivery_date).id }
    shipping_area_id { FactoryBot.create(:shipping_area).id }
    association :user
  end
end
