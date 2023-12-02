class Item < ApplicationRecord
  
  #belongs_to :user
  has_many :purchases

  

  validates :item_name, presence: true
  validates :item_detail, presence: true
  validates :item_price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :item_content, presence: true
  validates :delivery_price, presence: true
  validates :delivery_date, presence: true
  validates :shipping_area, presence: true

end
