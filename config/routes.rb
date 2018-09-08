Rails.application.routes.draw do
  resources :sessions
  resources :favorites, only:[:create,:destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get '/' => "home#top"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blogs do
    collection do
      post :confirm
    end
  end

  resources :users

end
