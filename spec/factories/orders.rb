FactoryBot.define do
  factory :order do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {"123-4567"}
    shipping_area_id {2}
    municipality {"横浜市緑区"}
    street_address {"青山1-1-1"}
    telephone_number {"09012345678"}
    user_id {create(:user).id}
    item_id {create(:item).id}
  end
end
