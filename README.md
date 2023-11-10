
# users
 | Column        | Type   |   Options             |
 | ------------- | ------ | --------------------- |
 | mail          | string | NOT NULL,unique: true |
 | password      | string | NOT NULL              |
 | user_name     | string | NOT NULL,unique: true |
 | date of birth | string | NOT NULL              |


# items
 | Column         | Type   | Options  |
 | -------------- | ------ | -------- |
 | item_name      | string | NOT NULL |
 | item_detail    | string | NOT NULL |
 | item_price     | string | NOT NULL |
 | item_content   | string | NOT NULL |
 | delivery_price | string | NOT NULL |
 | delivery_date  | string | NOT NULL |

 
# credit_card 

 | Column        | Type   | Options  |
 | ------------- | ------ | -------- |
 | credit_number | string | NOT NULL |
 | year          | string | NOT NULL |
 | month         | string | NOT NULL |
 | cvc           | string | NOT NULL |
 | name          | string | NOT NULL |
 | user          | string | NOT NULL |


# purchase
| Column           | Type   | Options  |
| ---------------- | ------ | -------- |
| post_code        | string | NOT NULL |
| prefectures      | string | NOT NULL |
| municipalities   | string | NOT NULL |
| building_name    | string | NOT NULL |
| telephone number | string | NOT NULL |
| birthday      | string | NOT NULL    |

  Association
  has_one :credit_card
  has_one :address 
  has_many :items

# items
 | Column         | Type   | Options                                  |
 | -------------- | ------ | ---------------------------------------- |
 | item_name      | text    | NOT NULL                                |
 | item_detail    | text    | NOT NULL                                |
 | item_price     | integer | NOT NULL                                |
 | item_content   | string  | NOT NULL                                |
 | delivery_price | string  | NOT NULL                                |
 | delivery_date  | string  | NOT NULL                                |
 | shipping area  | string  | NOT NULL                                |
 | user_id        | string  | NOT NULL,unique: true,foreign_key: true |

  Association
  belongs_to :user
 
# purchases
| Column           | Type   | Options                                 |
| ---------------- | ------ | --------------------------------------- |
| post_code        | string | NOT NULL                                |
| prefectures      | string | NOT NULL                                |
| municipalities   | string | NOT NULL                                |
| street_address   | string | NOT NULL                                |
| building_name    | string |                                         |
| telephone number | string | NOT NULL                                |
| user_id          | string | NOT NULL,unique: true,foreign_key: true |
| items_id         | string | NOT NULL,unique: true,foreign_key: true |

  Association
  belongs_to :user
  belongs_to :item



