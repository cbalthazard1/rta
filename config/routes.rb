Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "tables#index"

  mount GoodJob::Engine => 'good_job'

  get "tables/:id/:season", to: "tables#show", as: 'table_season'

  resources :tables do
    get 'refresh', on: :member
    get 'refresh_all', on: :collection

    resources :table_rows
  end

  resources :clubs do
    get 'refresh', on: :member
    get 'refresh_all', on: :collection
  end
end
