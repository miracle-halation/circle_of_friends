# User

| Column | Type | Options |
| ------ | ---- | ------- |
| nickname | string | null:false |
| email | string | null:false |
| password | string | null:false |

# Association
- has_many :circles, through :user_circles
- has_many :user_circles
- has_many :articles
- has_many :events, through :user_events
- has_many :user_events
- has_many :comments

# Circle
| Column | Type | Options |
| ------ | ---- | ------- |
| name | string | null:false |
| description | text | null:false |
| genre_id | integer | null:false |
| activity_id | integer | null:false |
| age_range_id | integer | null:false |
| prefecture_id | integer | null:false |

# Association
- has_many :users, through :user_circles
- has_many :user_circles
- has_many :articles
- has_many :events

# UserCircle
| Column | Type | Options |
| ------ | ---- | ------- |
| user | references | null:false, foreign_key: true |
| circle | references | null:false, foreign_key: true |
| leader | boolean | default:false, null:false |

# Association
- belongs_to :user
- belongs_to :circle

# Article
| Column | Type | Options |
| ------ | ---- | ------- |
| title | string | null:false |
| user | references | null:false, foreign_key: true |
| circle | references | null:false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :circle

# Event
| Column | Type | Options |
| ------ | ---- | ------- |
| title | string | null:false |
| body | text | null:false |
| start_date | datetime | null:false |
| end_date | datetime | null:false |
| circle | references | null:false, foreign_key: true |

# Association
- has_many :users, through :user_events
- has_many :user_events
- belongs_to :circle

# UserEvent
| Column | Type | Options |
| ------ | ---- | ------- |
| user | references | null:false, foreign_key: true |
| event | references | null:false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :event

# Comment
| Column | Type | Options |
| ------ | ---- | ------- |
| content | text | null:false |
| user | references | null:false, foreign_key: true |
| event | references | null:false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :event