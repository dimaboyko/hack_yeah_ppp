require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  root to: "panel/auctions#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'verify' => 'verification#show'
      post 'auctions' => 'auctions#create'

      match '*path', to: 'base#routing_error', via: :all
    end
  end

  namespace :panel do
    get 'lista_aukcji' => 'auctions#index'
    get 'eksport_do_csv', to: 'auctions#export', as: :auctions_export
  end
end
