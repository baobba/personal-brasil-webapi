Rails.application.routes.draw do
  post 'users/update_image', to: "users#update_image"

  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations:  'registrations'
  }

  resources :admins, except: [:new, :edit]
  devise_for :admins
end
