class User < ApplicationRecord

  has_one :credit_card
  has_one :address
  has_many :items
  has_many :purchases

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :mail, presence: true, uniqueness: true
  validates :password, presence: true
  validates :user_name, presence: true, uniqueness: true
  validates :birthday, presence: true
  validates :category, presence: true
end
