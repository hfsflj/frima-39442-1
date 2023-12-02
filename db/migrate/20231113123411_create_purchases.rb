class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.string :product_name

      t.timestamps
    end
  end
end
