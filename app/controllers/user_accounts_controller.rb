# -*- coding: utf-8 -*-
class UserAccountsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user_account!

  def edit
  end

  def update
    param = params[:user_account]
    if param[:password].blank? && param[:password_confirmation].blank?
      param.delete(:password)
      param.delete(:password_confirmation)
    end
    if @user_account.update_attributes(param)
      flash[:notice] = '更新しました'
      redirect_to member_path @user_account.member
    else
      render :edit
    end
  end

  def new
  end

  def create
    if @user_account.save
      redirect_to members_path
    else
      render :new
    end
  end
end
