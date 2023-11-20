class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false,unique: true
      t.string :encrypted_password, null: false
      t.string :user_name, null: false
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.date :birthday, null: false
           
       Association
       has_many :items
       has_many :purchases
    

      t.timestamps
    end
  end
end
