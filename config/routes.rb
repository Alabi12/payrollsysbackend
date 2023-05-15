Rails.application.routes.draw do
  devise_for :users
  resources :payroll_entries
  resources :payroll_periods
  resources :salaries
  resources :employees
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
