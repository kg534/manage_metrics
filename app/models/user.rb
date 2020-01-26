class User < ApplicationRecord
  has_secure_password

  has_many :groups, through: :group_users
  has_many :group_users

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :tasks
end
