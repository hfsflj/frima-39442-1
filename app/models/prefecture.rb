class Prefecture < ApplicationRecord
  t.references :user, null: false,foreign_key: true
  t.references :item, null: false,foreign_key: true
  
end
