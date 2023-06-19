Rails.application.routes.draw do
  resources :products do
    delete :remove_image, on: :member
  end
  resources :sellers do
  resources :products, only: %i[index]
  end
  
  resource :session, only: %i[new create destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"
  

end

