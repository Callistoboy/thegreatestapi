Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: 'api' do
    namespace :v1 do
      resources :jobs
      # resources :applies
      # resources :geeks
      resources :companies do
        match 'mark_deleted', to: 'companies/mark_deleted', via: :put
        resources :jobs
      end
    end
  end

  match "*path", to: "application#catch_404", via: :all


end
