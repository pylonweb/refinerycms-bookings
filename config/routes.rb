Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :bookings do
    resources :bookings, :path => '', :only => [:index]
  end

  # Admin routes
  namespace :bookings, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :bookings, :only => [:index] do
        collection do
          post "book"
          post "release"
        end
      end
    end
  end

end
