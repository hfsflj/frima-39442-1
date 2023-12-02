class CreateAnotherTables < ActiveRecord::Migration[6.0]
def change
  create_table :another_tables do |t|
    # ここに必要なカラムの定義を追加することができます
    t.references :user, foreign_key: true

    t.timestamps
  end
end
end

