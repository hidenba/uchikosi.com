# -*- coding: utf-8 -*-
class MembersController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user_account!

  def index
    @members = Member.all
  end

  def show
  end

  def edit
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      redirect_to members_path
    end
  end

  def destroy
    Member.find(params[:id]).destroy
    redirect_to :back
  end
end
