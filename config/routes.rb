Attend::Application.routes.draw do

  resources :lessons


  resources :klasses


  resources :students


  devise_for :users, :controllers => {:confirmations => 'confirmations'}

    devise_scope :user do
      put "/confirm" => "confirmations#confirm"
    end

  root to: 'home#index'

end