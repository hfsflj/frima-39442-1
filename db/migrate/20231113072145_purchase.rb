class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.belongs_to :user
      t.belongs_to :item

      t.timestamps
    end

    add_index :purchases, :item_id, unique: true
  end
end
