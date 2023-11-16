
# users
 | Column        | Type   |   Options                |
 | ------------- | ------ | --------------------- |
 | email          | string | null: false,unique: true |
 | encrypted_password      | string | null: false     |
 | user_name     | string | null: false               |
 | last_name     | string | null: false               |
 | first_name     | string | null: false               |
 | last_name_frigana     | string | null: false               |
 | first_name_frigana     | string | null: false               |
 | birthday      | date | null: false               |

  Association
  has_many :items
  has_one :purchases

# items
 | Column         | Type   | Options                                  |
 | -------------- | ------ | ---------------------------------------- |
 | item_name      | string    | null: false                                |
 | category_id      | integer    | null: false                                 |
 | item_detail    | text    | null: false                                |
 | item_price     | integer | null: false                                |
 | item_content_id  | integer  | null: false                                |
 | delivery_price_id | integer  | null: false                                |
 | delivery_date_id  | integer | null: false                                |
 | shipping_area_id  | integer | null: false                                |
 | user        | references  | null: false,foreign_key: true |
 
  Association
  belongs_to :user
  has_one :purchases
 
# shipping_addresses
| Column           | Type   | Options                                 |
| ---------------- | ------ | --------------------------------------- |
| post_code        | integer | null: false                                |
| prefectures_id      | integer | null: false                                |
| municipalities   | string | null: false                                |
| street_address   | string | null: false                                |
| building_name    | string |                                 |
| telephone_number | integer | null: false                                |
| purchase   | references  | null: false,foreign_key: true |


Association
  belongs_to :purchases

# purchases
| user        | references  | null: false,foreign_key: true |
| item         | references  | null: false,foreign_key: true |

  Association
  belongs_to :user
  belongs_to :item
  


