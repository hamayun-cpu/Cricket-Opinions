class Opinion < ApplicationRecord
  belongs_to :user
  validates :thought, presence: true
  validates :user_id, presence: true
end
