UchikosiCom::Application.routes.draw do
  devise_for :user_account

  resources :user_accounts, only: %w(new create)

  resource :dashboard, only: %w(show)

  resources :members, except: %w(new create)
end
