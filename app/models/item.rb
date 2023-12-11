class Item < ApplicationRecord
  belongs_to :user
  has_many :purchases

  validates :item_name, presence: true
  validates :item_detail, presence: true
  validates :item_price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :item_condition_id, presence: true
  validates :delivery_price_id, presence: true
  validates :delivery_date_id, presence: true
  validates :shipping_area_id, presence: true

  # 追加
  has_one_attached :item_image
end
