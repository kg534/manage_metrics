class Report < ApplicationRecord
  validates :active_date, presence: true
  validates :phone, presence: true
  validates :visit, presence: true
  validates :negotiate, presence: true

  belongs_to :user

  scope :recent, -> { order(active_date: :asc) }
end 
