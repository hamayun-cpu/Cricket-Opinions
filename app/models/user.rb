class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true
  validates :fullname, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  has_many :opinions
end
