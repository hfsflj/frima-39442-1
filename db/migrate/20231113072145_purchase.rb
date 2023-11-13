class Purchase < ActiveRecord::Migration[6.0]
  def change
  end
  belongs_to :user
  belongs_to :item

  validates :item_id, uniqueness: true

end
