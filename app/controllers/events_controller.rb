# -*- coding: utf-8 -*-
class EventsController < ApplicationController
  before_filter :authenticate_user_account!

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @event.stages.build
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.delete
    redirect_to events_path
  end
end
