Rails.application.routes.draw do
  devise_for :users
 
  get "up" => "rails/health#show", as: :rails_health_check

 
  root "home#index"

  namespace :admin do
    resources :companies
  end

 namespace :student do
    resources :companies
    resources :courses
  end

   namespace :teacher do
    resources :students
     resources :courses
  end

end
