module Refinery
  module Bookings
    module Admin
      class BookingsController < ::Refinery::AdminController
        cache_sweeper Bookings::BookingSweeper
        
        def index
          @bookings = Booking.all
          
          respond_to do |format|
            format.html 
            format.js   { render :json => { 
              :dates => Booking.select(:date).map{|b| b.date.to_date.strftime('%Y,%m,%d')},
              :start_date => Date.today.strftime('%d-%m-%Y') } }
          end
        end
        
        def book
          puts "FROM: #{params[:from]} TO: #{params[:to]}"
          from = Date.parse(params[:from])
          to = Date.parse(params[:to])
          
          @bookings = []
          from.upto(to).each do |date|
            @bookings << Booking.find_or_create_by_date(:status => true, :date => date)
          end
          
          start_date = @bookings.first.date.strftime('%d-%m-%Y') if @bookings.present?

          respond_to do |format|
            format.html { redirect_to refinery.bookings_admin_bookings_path }
            format.js   { render :json => { 
              :dates => Booking.select(:date).map{|b| b.date.strftime('%Y,%m,%d')}, 
              :start_date => start_date 
              }}
          end
        end
        
        def release
          from = Date.parse(params[:from])
          to = Date.parse(params[:to])
          puts "FROM: #{from} TO: #{to}"
          @bookings = Booking.in_date(from, to)
          if @bookings.present?
            start_date = @bookings.first.date.strftime('%d-%m-%Y')
            @bookings.destroy_all
          end
          
          respond_to do |format|
            format.html { redirect_to refinery.bookings_admin_bookings_path }
            format.js   { render :json => { 
              :dates => Booking.select(:date).map{|b| b.date.strftime('%Y,%m,%d')}, 
              :start_date => start_date
              }}
          end
        end

      end
    end
  end
end
