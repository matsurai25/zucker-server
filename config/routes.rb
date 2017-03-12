Rails.application.routes.draw do
  resources :users
  resources :products
  root 'landing#index'
  namespace :api, format: 'json' do
    namespace :v1 do
      resources :products
      resources :users
    end
  end
  get  '*unmatched_route', to: 'errors#render_404', format: false
end
