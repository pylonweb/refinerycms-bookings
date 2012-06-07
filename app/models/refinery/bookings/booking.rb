module Refinery
  module Bookings
    class Booking < Refinery::Core::BaseModel
      self.table_name = 'refinery_bookings'
      
      attr_accessible :status, :date
      
      validate :date, uniqueness: true, presence: true
      
      scope :in_date, lambda { |from, to| where("date >= ? AND date <= ?", from, to) }
      scope :month, lambda { |date| where("date >= ? AND date <= ?", date.at_beginning_of_month, date.at_end_of_month) }
      scope :current_month, lambda { where("date >= ? AND date <= ?", Date.today.at_beginning_of_month, Date.today.at_end_of_month) }
    end
  end
end
