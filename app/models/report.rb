class Report < ApplicationRecord
  validates :active_date, presence: true
  validates :phone, presence: true
  validates :visit, presence: true
  validates :negotiate, presence: true

  belongs_to :user

  scope :recent, -> { order(active_date: :asc) }
  scope :latest, -> { order(:active_date).reverse_order.limit(1) }

  def self.csv_attributes
    ["active_date", "order", "phone", "visit", "negotiate", "good_thing", "problem", "goal", "created_at", "updated_at"]
  end

  def self.csv_headers
    ["活動日", "受注", "有効電話", "訪問", "商談", "よかったこと", "問題・改善点", "目標", "登録日", "更新日"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |report|
        csv << csv_attributes.map{ |attr| report.send(attr) }
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      report = new
      report.attributes = row.to_hash.slice(*csv_attributes)
      report.save!
    end
  end
end 
