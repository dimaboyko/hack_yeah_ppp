Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'verify' => 'verification#show'
      post 'auctions' => 'auctions#create'

      match '*path', to: 'base#routing_error', via: :all
    end
  end
end
