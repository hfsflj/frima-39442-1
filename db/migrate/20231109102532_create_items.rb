class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :category, null: false
      t.text :item_detail, null: false
      t.integer :item_price, null: false
      t.string :item_content
      t.string :delivery_price
      t.string :delivery_date
      t.string :shipping_area
      t.references :user, null: false, foreign_key: true

      belongs_to :user
      has_one :purchase

      t.timestamps
    end
  end
end
