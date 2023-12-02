class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :user_name, presence: true
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角漢字・ひらがな・カタカナで入力してください" }
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角漢字・ひらがな・カタカナで入力してください" }

         validates :last_name_frigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "can't be blank" }
         validates :first_name_frigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "can't be blank" }

         validates :birthday, presence: true
         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: "must contain at least one numeric character" }
        
         
end
