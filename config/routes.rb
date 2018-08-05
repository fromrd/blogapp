Rails.application.routes.draw do
  resources :blogs do
    collection do
      post :confirm
      get :blogdates
      post :blogdates
    end
  end
end