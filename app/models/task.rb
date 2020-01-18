class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  scope :recent, -> { order(end_time: :desc) }

  belongs_to :user

  def start_time
    self.end_time
  end
end
