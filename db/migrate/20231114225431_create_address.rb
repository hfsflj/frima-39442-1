class CreateAddress < ActiveRecord::Migration[6.0]
  def change
    create_table :addres do |t|

      t.timestamps
    end
  end
end
