class ApplicationController < ActionController::Base
  protect_from_forgery

  alias_method :current_user, :current_user_account
end
