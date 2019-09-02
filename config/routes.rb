Rails.application.routes.draw do
    devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
  
  resource :tweets,only:[:new,:create,:index]
  delete  'tweets/:id'  => 'tweets#destroy'
  get   'tweets/:id/edit'  => 'tweets#edit'
  patch   'tweets/:id'  => 'tweets#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "tweets#index"
  
end