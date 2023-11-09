class CreatePrefectures < ActiveHash::Base
  def change
    create_table :prefectures do |t|

      t.timestamps
    end
  end
end
