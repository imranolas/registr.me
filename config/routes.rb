Attend::Application.routes.draw do

  devise_for :users, :controllers => {:confirmations => 'confirmations'}

    devise_scope :user do
      put "/confirm" => "confirmations#confirm"
    end


  resources :registrations


  resources :lessons
  resources :klasses do
    resources :build, controller: 'klasses/build'
  end

  put 'students/edit_multiple', to: 'students#edit_multiple', as: 'edit_multiple_students'
  put 'students/update_multiple', to: 'students#update_multiple', as: 'update_multiple_students'
  
  resources :students
  
  root to: 'home#index'

end
