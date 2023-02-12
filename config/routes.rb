Rails.application.routes.draw do
  devise_for :users,
               path: '',
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
               },
               controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations'
               }
  resources :categories
  resources :users do
    resources :orders, only: %i[index show destroy]
  end
  get "/current_user", to: "users#user_logged_in"
end
