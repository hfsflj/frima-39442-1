class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :item_condition, class_name: 'ItemCondition', foreign_key: 'item_condition_id'
  belongs_to :delivery_price, class_name: 'DeliveryPrice', foreign_key: 'delivery_price_id'
  belongs_to :delivery_date, class_name: 'DeliveryDate', foreign_key: 'delivery_date_id'
  belongs_to :shipping_area, class_name: 'ShippingArea', foreign_key: 'shipping_area_id'

  validates :item_name, presence: { message: "can't be blank" }
  validates :item_detail, presence: { message: "can't be blank" }
  validates :item_price, presence: { message: "can't be blank" }, numericality: { only_integer: true, greater_than: 300, less_than: 10_000_000 }, format: { with: /\A\d+\z/, message: "must be a number" }
  validates :item_condition_id, presence: { message: "can't be blank" }, numericality: { other_than: 1, message: 'must be other than ---' }, exclusion: { in: [nil], message: "can't be blank" }
  validates :delivery_price_id, presence: { message: "can't be blank" }, numericality: { other_than: 1, message: 'must be other than ---' }, exclusion: { in: [nil], message: "can't be blank" }
  validates :delivery_date_id, presence: { message: "can't be blank" }, numericality: { other_than: 1, message: 'must be other than ---' }, exclusion: { in: [nil], message: "can't be blank" }
  validates :shipping_area_id, presence: { message: "can't be blank" }, numericality: { other_than: 1, message: 'must be other than ---' }, exclusion: { in: [nil], message: "can't be blank" }
  validates :item_image, presence: { message: "can't be blank" }
  # def sold_out?
  #   # 売れたかどうかを判断するロジック
  #   # 例: self.sold が true なら売れたと判断
  #   self.sold
  # end
  has_one_attached :item_image
end
