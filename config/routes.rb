Attend::Application.routes.draw do

  resources :comments

  devise_for :users, :controllers => { :invitations => 'users/invitations'}
  
  devise_scope :user do
    put "/confirm" => "confirmations#confirm"
  end
  

  resources :organisations do
    put 'students/edit_multiple', to: 'students#edit_multiple', as: 'edit_multiple_students'
    put 'students/update_multiple', to: 'students#update_multiple', as: 'update_multiple_students'
    put 'lessons/edit_multiple', to: 'lessons#edit_multiple', as: 'edit_multiple_lessons'
    put 'lessons/update_multiple', to: 'lessons#update_multiple', as: 'update_multiple_lessons'


    resources :students do
      collection { post :import }
    end

    resources :lessons do
      collection { post :import }
    end
    
    resources :klasses do
      resources :build, controller: 'klasses/build'
    end

    resources :registrations
    devise_for :users, :controllers => { :invitations => 'users/invitations'}

  end
  
  root to: 'home#index'

end
