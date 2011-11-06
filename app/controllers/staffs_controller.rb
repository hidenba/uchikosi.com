# -*- coding: utf-8 -*-
class StaffsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user_account!

  def create
    event = Event.find(params[:event_id])
    stage = event.stages.find(params[:stage_id])
    stage.staffs.create!(params[:staff].merge(member: current_user_account.member))
    redirect_to :back
  end

  def destroy
    Staff.find(params[:id]).destroy
    redirect_to :back
  end
end
