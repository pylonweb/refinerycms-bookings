require 'spec_helper'

module Refinery
  module Bookings
    describe Booking do
      describe "validations" do
        subject do
          FactoryGirl.create(:booking)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
