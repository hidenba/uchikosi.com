class DashboardsController < ApplicationController
  before_filter :authenticate_user_account!
  def show
  end
end
