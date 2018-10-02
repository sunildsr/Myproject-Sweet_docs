class Reading < ApplicationRecord

  
  validates :glucose_reading, presence: :true
  validates :glucose_reading, numericality: { only_integer: true }
  validate :reading_within_daily_limit, on: :create
 
  
  def reading_within_daily_limit
    if Reading.for_day.count >= 4
      errors.add(:reading, "cannot be entered more than 4 times per day")
    end
  end

  def self.for_day(from_date = Time.zone.now.to_date)
   where("DATE(created_at) = ?", from_date)
  end
  
   def self.get_readings_data(from_date, to_date)
   where("DATE(created_at) between ? and ?", from_date, to_date)
  end
  
  
    def self.available_dates
    pluck("DATE(created_at)").uniq
  end

  def self.available_months
    available_dates.map do |date|
      date.strftime("%B %Y")
    end.uniq
  end
  
  def self.format_date(date_string)
    DateTime.parse(date_string)
  end
  

  
  
end
