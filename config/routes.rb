Rails.application.routes.draw do
  mount_devise_token_auth_for 'Employee', at: 'auth'

  namespace :api do
    namespace :v1 do
      resources :employees
      resources :departments
    end
  end
end
