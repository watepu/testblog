Rails.application.routes.draw do

  root "home#top"
  resources :sessions
  resources :favorites, only:[:create,:destroy]
  resources :users
  resources :relationships, only:[:create, :destroy]
  resources :blogs do
    resources :comments
    collection do
      post :confirm
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
