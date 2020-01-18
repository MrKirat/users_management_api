Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'Employee', at: 'auth', controllers: {
          sessions:  'api/v1/overrides/sessions',
          registrations:  'api/v1/overrides/registrations',
          token_validations: 'api/v1/overrides/token_validations'
      }
      resources :employees
      resources :departments
    end
  end
end
