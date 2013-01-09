module Refinery
  module Bookings
    class BookingSweeper < ActionController::Caching::Sweeper
      observe Booking

      def after_save(booking)
        expire_cache!
      end

      def after_destroy(booking)
        expire_cache!
      end

      protected

      def expire_cache!
        # TODO: Where does page_cache_directory come from??
        return unless page_cache_directory
        page_cache_directory_path = Pathname.new(page_cache_directory.to_s)

        # Delete the pages index files (/refinery/cache/pages.html*)
        Pathname.glob(page_cache_directory_path.join('refinery', 'cache', 'pages', 'bookings*')).each do |cache_index|
          cache_index.delete
        end
      end

    end
  end
end
