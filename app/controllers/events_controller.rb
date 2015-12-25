class EventsController < ApplicationController
  def index
    @events = Event.search(nil)
  end

  def show
    @event = Event.find(params[:id])
  end

  def search
    @events = Event.search(params[:query])
  end

  def new
    @categories = Category.all
  end
end
