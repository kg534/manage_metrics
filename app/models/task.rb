class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  scope :recent, -> { order(end: :desc) }
end
