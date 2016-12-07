Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      # resources :pets, only: [:index, :show]
      resources :pets
    end
  end

  # get '/api/v1/pets/petFind' => 'pets#petFind'

end
