Attend::Application.routes.draw do

  resources :lessons
  resources :klasses do
    resources :build, controller: 'klasses/build'
  end
  resources :students
  devise_for :users, :controllers => {:confirmations => 'confirmations'}

    devise_scope :user do
      put "/confirm" => "confirmations#confirm"
    end

  root to: 'home#index'

end
