UchikosiCom::Application.routes.draw do
  devise_for :user_account
  resource :dashboard, only: %w(show)
end
