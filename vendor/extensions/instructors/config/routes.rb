Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :instructors do
    resources :instructors, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :instructors, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :instructors, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
