module Refinery
  module Bookings
    class Version
      @major = 2
      @minor = 4
      @tiny  = 0
      @build = nil

      class << self
        attr_reader :major, :minor, :tiny, :build

        def to_s
          [@major, @minor, @tiny, @build].compact.join('.')
        end
      end
    end
  end
end