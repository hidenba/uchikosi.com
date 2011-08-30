# -*- coding: utf-8 -*-
class UserAccountsController < ApplicationController
  before_filter :authenticate_user_account!

  def new
    @user_account = UserAccount.new
  end

  def create
    @user_account = UserAccount.new(params[:user_account])
    if @user_account.save
      redirect_to members_path
    else
      render :new
    end
  end
end
