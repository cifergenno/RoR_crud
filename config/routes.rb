Rails.application.routes.draw do
  resources :products do
    member do
      get :view
      post :edit
      post :delete
    end
  end
end
