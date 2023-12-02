class Category < ApplicationRecord
  self.data = [
    { id: 1, name: '食品' },
    { id: 2, name: '美容' },
    { id: 3, name: '日用品' },
    { id: 4, name: '娯楽' },
    { id: 5, name: 'インテリア' },
    { id: 6, name: 'ファッション' },
    { id: 7, name: '雑貨' },
    { id: 8, name: '書籍' },
    { id: 9, name: '音楽' },
    { id: 10, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :items
end
