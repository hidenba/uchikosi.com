# -*- coding: utf-8 -*-
class EventsController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user_account!

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @event.stages.build
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    @event.stages.build if @event.stages.size.zero?
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes params[:event].to_hash
      redirect_to event_path(@event)
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
