UchikosiCom::Application.routes.draw do
  root :to => 'dashboards#show'

  devise_for :user_account

  resources :user_accounts

  resource :dashboard, only: %w(show)

  resources :members, except: %w(new create)


  resources :stages, only: [] do
    resources :constitution
  end

  resources :events do
    resources :stages do
      resources :staffs, only: %w(create destroy)
    end
    resources :comments, only: %w(create)
  end


end
