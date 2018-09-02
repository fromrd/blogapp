Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  resources :blogs do
    collection do
      post :confirm
      get :blogdates
      post :blogdates
    end
  end
  
  resources :users, only: [:new, :create, :show]
  
  resources :favorites, only: [:create, :destroy]
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end