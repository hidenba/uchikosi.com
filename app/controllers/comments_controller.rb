# -*- coding: utf-8 -*-
class CommentsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user_account!

  def create
    event = Event.find(params[:event_id])
    event.comments.create!(params[:comment].merge(author: current_user_account.member))
    redirect_to :back
  end

end
