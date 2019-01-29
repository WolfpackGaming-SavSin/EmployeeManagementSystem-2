Rails.application.routes.draw do
  devise_for :users

  scope "/admin" do
    resources :users
    resources :employees
    resources :locations
    resources :securities
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/admin' => 'pages#admin'
  get '/roster' => 'employees#roster'
  get '/roster/disabled' => 'employees#disabled'

end
