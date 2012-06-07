class CreateBookingsBookings < ActiveRecord::Migration

  def up
    create_table :refinery_bookings do |t|
      t.datetime :date, default: true
      t.boolean :status

      t.timestamps
    end
    
    add_index :refinery_bookings, :date, :unique => true

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms_bookings"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/bookings"})
    end

    drop_table :refinery_bookings

  end

end
