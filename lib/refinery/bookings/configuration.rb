module Refinery
  module Bookings
    include ActiveSupport::Configurable

    config_accessor :booking_statuses

    self.booking_statuses = [{:name => 'booked', :color => '#ee1100'}]
  end
end