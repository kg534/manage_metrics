class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  scope :recent, -> { order(end_time: :asc) }

  today = Date.today
  scope :search_today, -> { where("end_time >= ? AND end_time < ?", today, today + 1) }
  scope :search_within, -> { where('end_time >= ?', today + 1) }
  scope :search_expired, -> { where('end_time < ?', today) }
  scope :search_task_calendar, -> { where('end_time >= ?', today) }

  belongs_to :user

  def start_time
    self.end_time
  end
end
