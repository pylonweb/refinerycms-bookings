require 'refinerycms-core'

module Refinery
  autoload :BookingsGenerator, 'generators/refinery/bookings/bookings_generator'

  module Bookings
    require 'refinery/bookings/engine'
    require 'refinery/bookings/configuration'
    
    autoload :Version, 'refinery/bookings/version'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end
      
      def version
        ::Refinery::Bookings::Version.to_s
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
