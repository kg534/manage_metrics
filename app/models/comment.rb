class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :report

  validates :text, presence: true
end
