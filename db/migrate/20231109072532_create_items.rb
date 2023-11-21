class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.integer :category_id, null: false, foreign_key: true
      t.text :item_detail, null: false
      t.integer :item_price, null: false
      t.integer :item_content_id, null: false
      t.integer :delivery_price_id, null: false
      t.integer :delivery_date_id, null: false
      t.integer :shipping_area_id, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

 