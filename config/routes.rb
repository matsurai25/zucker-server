Rails.application.routes.draw do
  scope '(:locale)', constraints: { locale: /ja|en/ }, defaults: {locale: 'en'} do
    root 'landing#index'
    resources :users
    resources :products
    namespace :api, format: 'json' do
      namespace :v1 do
        resources :products
        resources :users
      end
    end
    # get  '*unmatched_route', to: 'errors#render_404', format: false
  end
end
