class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

     #has_many :items
     #has_many :purchases
         validates :user_name, presence: { message: "can't be blank" }


         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "can't be blank" }
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "can't be blank" }
       
         validates :last_name_frigana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "can't be blank" }
         validates :first_name_frigana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "can't be blank" }


         validates :birthday, presence: true
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "must contain at least one numeric character" }
    
         
end
