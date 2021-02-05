class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'user', foreign_key: 'follower_id'
  belongs_to :followed_id, class_name: 'user', foreign_key: 'followed_id'
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end