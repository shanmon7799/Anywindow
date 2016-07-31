Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :windows do
    resources :comments

    collection do
      get :search
      get :random
      get :map
      get :city_detail
      get :window_detail
    end
  end
  # Web API
  scope :path => '/api/v1/', :module => "api_v1", :as => 'v1', :defaults => { :format => :json } do
    resources :windows, only: [:index, :show, :update] do
      resources :comments, only: [:index, :create, :update, :destroy]
    end

    post "login" => "auth#login"
    post "logout" => "auth#logout"
  end

  #後台路由
  namespace :admin do
    resources :windows do
      collection do
        post :import
      end
    end
    resources :users
    resources :quotes do
      collection do
       post :import
     end
    end
    resources :cities do
      collection do
       post :import
      end
    end
  end

  # root_path
  root "windows#index"
end
