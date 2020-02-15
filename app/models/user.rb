class User < ApplicationRecord
  has_secure_password

  has_many :group_users
  has_many :groups, through: :group_users

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :tasks
  has_many :reports
  has_many :comments
end
