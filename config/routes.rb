Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: 'api' do
    namespace :v1 do
      resources :jobs
      resources :applies
      resources :geeks
      match 'companies/:id/delete_company', to: 'companies#delete_company', via: :put
      resources :companies do
        # resources :jobs
      end
    end
  end

  match "*path", to: "application#catch_404", via: :all



end
