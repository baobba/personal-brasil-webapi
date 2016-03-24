Rails.application.routes.draw do
  resources :personal_clients, except: [:new, :edit]
  post 'users/update_image', to: "users#update_image"

  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations:  'registrations'
  }

  resources :admins, except: [:new, :edit]
  devise_for :admins
end
