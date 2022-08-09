Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  
  resources :pets do
    resources :registrations do
      resources :appointments, only: [:create, :index, :new]
    end
  end
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'users#signin'
  post '/signin', to: 'users#authenticate'

end
