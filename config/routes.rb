Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "conversations#index"

  resources :conversations do
    resources :messages, only: [:create]
  end
  post '/configure_openai_key', to: 'application#configure_openai_key'
end
