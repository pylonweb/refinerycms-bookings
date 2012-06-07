module Refinery
  module Bookings
    class BookingsController < ::ApplicationController

      before_filter :find_all_bookings
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @booking in the line below:
        
        respond_to do |format|
          format.html { present(@page) }
          format.js   { render :json => { 
            :dates => @bookings.map{|b| b.date.to_date.strftime('%Y,%m,%d')},
            :start_date => Date.today.strftime('%d-%m-%Y') } }
        end
      end

    protected

      def find_all_bookings
        @bookings = Booking.order('date ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/bookings").first
      end

    end
  end
end
