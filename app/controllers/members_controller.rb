# -*- coding: utf-8 -*-
class MembersController < ApplicationController
  before_filter :authenticate_user_account!

  def index
    @members = Member.all
  end

  def edit
    @member = Member.find(params[:id])
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
