class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true
  validates :fullname, presence: true

  validates :username, uniqueness: true
  validates :email, uniqueness: true

  has_many :opinions, dependent: :delete_all

  has_many :follows

  has_many :recieved_follows, foreign_key: :followed_id, class_name: 'Follow'
  has_many :followers, through: :recieved_follows, source: :follower

  has_many :given_follows, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followings, through: :given_follows, source: :followed

  has_one_attached :main_image

  has_one_attached :cover_image

  validate :acceptable_main_image

  validate :acceptable_cover_image

  def acceptable_main_image
    return unless main_image.attached?

    unless main_image.byte_size <= 1.megabyte
      errors.add(:main_image, 'is too big')
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(main_image.content_type)
      errors.add(:main_image, "must be a JPEG or PNG")
    end
  end

  def acceptable_cover_image
    return unless cover_image.attached?

    unless cover_image.byte_size <= 1.megabyte
      errors.add(:cover_image, 'is too big')
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(cover_image.content_type)
      errors.add(:cover_image, "must be a JPEG or PNG")
    end
  end
end
