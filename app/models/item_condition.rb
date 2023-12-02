class ItemCondition < ApplicationRecord
  self.data = [
    { id: 1, name: '新品、未使用' },
    { id: 2, name: '未使用に近い' },
    { id: 3, name: '目立った傷や汚れなし' },
    # 他にも必要な状態があれば追加
  ]

  include ActiveHash::Associations
  has_many :items
end
