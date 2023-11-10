
# users
 | Column        | Type   |   Options                |
 | ------------- | ------ | --------------------- |
 | email          | string | null: false,unique: true |
 | encrypted_password      | string | null: false              |
 | user_name     | string | null: false              |
 | birthday      | string | null: false              |

  Association
  has_one :credit_card
  has_one :address 
  has_many :items

# items
 | Column         | Type   | Options                                  |
 | -------------- | ------ | ---------------------------------------- |
 | item_name      | text    | null: false                                |
 | category      | text    | null: false                                |
 | item_detail    | text    | null: false                                |
 | item_price     | integer | null: false                                |
 | item_content   | string  | null: false                                |
 | delivery_price | string  | null: false                                |
 | delivery_date  | string  | null: false                                |
 | shipping area  | string  | null: false                                |
 | user_id        | string  | null: false,unique: true,foreign_key: true |

  Association
  belongs_to :user
 
# purchases
| Column           | Type   | Options                                 |
| ---------------- | ------ | --------------------------------------- |
| post_code        | string | null: false                                |
| prefectures      | string | null: false                                |
| municipalities   | string | null: false                                |
| street_address   | string | null: false                                |
| building_name    | string | null: false                                        |
| telephone number | string | null: false                                |
| user_id          | string | null: false,unique: true,foreign_key: true |
| items_id         | string | null: false,unique: true,foreign_key: true |

  Association
  belongs_to :user
  belongs_to :item


