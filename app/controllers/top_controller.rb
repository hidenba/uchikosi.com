# -*- coding: utf-8 -*-
class TopController < ApplicationController

  def index
    @events = Event.limit(2)
  end
end
