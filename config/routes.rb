UchikosiCom::Application.routes.draw do
  root :to => 'dashboards#show'

  devise_for :user_account

  resources :user_accounts, only: %w(new create)

  resource :dashboard, only: %w(show)

  resources :members, except: %w(new create)


  resources :events do
    resources :stages do
      resources :staffs, only: %w(create destroy)
    end
  end


end
