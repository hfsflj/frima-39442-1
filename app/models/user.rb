class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

 
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validates :user_name, presence: true, uniqueness: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_frigana , presence: true
  validates :first_name_frigana , presence: true
end
