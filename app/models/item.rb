class Item < ApplicationRecord
  #belongs_to :user
  has_many :purchases

  validates :item_name, presence: true
  validates :item_detail, presence: true
  validates :item_price, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 10_000_000 }
  validates :item_condition_id, presence: true, exclusion: { in: ['---'] }
  validates :delivery_price_id, presence: true, exclusion: { in: ['---'] }
  validates :delivery_date_id, presence: true, exclusion: { in: ['---'] }
  validates :shipping_area_id, presence: true, exclusion: { in: ['---'] }
  validates :item_image, presence: true

  has_one_attached :item_image
end
