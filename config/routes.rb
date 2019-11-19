Rails.application.routes.draw do  
  namespace 'api' do
    namespace 'v1' do
      resources :books, only: [:index, :create, :destroy]
    end
  end

  root to: "api/v1/books#index"
  
  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]
end
