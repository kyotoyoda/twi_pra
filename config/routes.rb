Rails.application.routes.draw do

  resources :tweets
  devise_for :users, :controllers => {
     :registrations => 'users/registrations',
     :sessions => 'users/sessions'
   }

   devise_scope :user do
     get "sign_in", :to => "tweets#show"
     get "sign_out", :to => "users/sessions#destroy"
   end

 resources :users, :only => [:index, :show]

  get 'home/index'

  get 'home/show'

  resources :users do
    member do
      get :followings, :followers
    end
  end

root to: "home#index"

post 'like/:tweet_id' => 'likes#like', as:'like'
delete 'unlike/:tweet_id' => 'likes#unlike', as:'unlike'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
