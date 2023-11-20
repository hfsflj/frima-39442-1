class CreatePrefectures < ActiveHash::Base
  def change
    create_table :prefectures do |t|

      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true


      t.timestamps
    end
  end
end
