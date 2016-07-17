Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :windows

  # Web API
  scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
    resources :windows # ApiV1::WindowsController

    post "login" => "auth#login"
    post "logout" => "auth#logout"

  end

  namespace :admin do
    resources :windows
    resources :users
  end

  # root_path
  root "windows#index"
end
