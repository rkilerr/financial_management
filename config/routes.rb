Rails.application.routes.draw do
  get 'reports/index'
  get 'reports/report_by_category'
  get 'reports/report_by_dates'
  post 'reports/generate_report'
  get 'main/index'
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server'
  resources :operations
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main#index"
end
