class User < ApplicationRecord
  has_many :sleep_records, dependent: :destroy

  has_many :active_follows, class_name: 'Follow', foreign_key: :follower_id
  has_many :followings, through: :active_follows, source: :followed

  has_many :passive_follows, class_name: 'Follow', foreign_key: :followed_id
  has_many :followers, through: :passive_follows, source: :follower
end
