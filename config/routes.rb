Rails.application.routes.draw do
  resources :products do
    member do
      get :view
    end
  end
end
