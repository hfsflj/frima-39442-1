
# users

 |Column|Type  |   Options   |

 mail |string|NOT NULL,unique: true|

 password |string|NOT NULL|

 user_name |string|NOT NULL,unique: true|

 last_name |string|NOT NULL|

 first_name |string|NOT NULL|

 date of birth |string|NOT NULL|



# items

 |Column|Type  |   Options   |

 item_name |string|NOT NULL|

 item_detail |string|NOT NULL|

 item_price |string|NOT NULL|

 item_content |string|NOT NULL|

 delivery_price |string|NOT NULL|

 delivery_date |string|NOT NULL|



 
# credit_card 

 |Column|Type  |   Options   |

 credit_number |string|NOT NULL|

 year |string|NOT NULL|

 month |string|NOT NULL|

 cvc |string|NOT NULL|

 name |string|NOT NULL|

 user |string|NOT NULL|



＃ purchase

|Column|Type  |   Options   |

post_code |string|NOT NULL|

prefectures |string|NOT NULL|

municipalities |string|NOT NULL|

building_name |string|NOT NULL|

telephone number |string|NOT NULL|

