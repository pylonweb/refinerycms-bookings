if defined?(::Refinery::User)
  ::Refinery::User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms_bookings').blank?
      user.plugins.create(:name => 'refinerycms_bookings',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end


if defined?(::Refinery::Page) && ::Refinery::Page.where(:link_url => "/bookings").empty?
  page = ::Refinery::Page.create(
    :title => 'Bookings',
    :link_url => "/bookings",
    :deletable => false,
    :menu_match => "^/bookings?(\/|\/.+?|)$"
  )
  Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
    page.parts.create(:title => default_page_part, :body => nil, :position => index)
  end
end

