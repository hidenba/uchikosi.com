# -*- coding: utf-8 -*-
class StaffsController < ApplicationController
  before_filter :authenticate_user_account!

  def create
    event = Event.find(params[:event_id])
    event.staffs.create!(params[:staff].merge(member: current_user_account.member))
    redirect_to :back
  end

  def destroy
    Staff.find(params[:id]).destroy
    redirect_to :back
  end
end
