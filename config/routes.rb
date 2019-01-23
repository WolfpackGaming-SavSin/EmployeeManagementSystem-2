Rails.application.routes.draw do
  devise_for :users
  scope "/admin" do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/admin' => 'pages#admin'
end
