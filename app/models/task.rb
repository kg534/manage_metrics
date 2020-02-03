class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  scope :recent, -> { order(end_time: :asc) }

  today = Date.today
  scope :search_today, -> { where("end_time >= ? AND end_time < ?", today, today + 1) }
  scope :search_within, -> { where('end_time >= ?', today + 1) }
  scope :search_expired, -> { where('end_time < ?', today) }
  scope :search_completed, -> { where(complete: true) }
  scope :search_not_completed, -> { where(complete: false) }

  belongs_to :user

  def start_time
    self.end_time
  end

  def self.csv_attributes
    ["name", "description", "end_time", "complete", "created_at", "updated_at"]
  end

  def self.csv_headers
    ["名前", "タスク内容", "期限", "完了フラグ", "登録日", "更新日"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_headers
      all.each do |task|
        csv << csv_attributes.map{ |attr| task.send(attr) }
      end
    end
  end
end
