class EventsController < ApplicationController
  before_action :authenticate_event_organizer!, only: [:create, :update, :destroy]

  # GET /events
  def index
    @events = Event.all
    render json: @events
  end

  def create
    @event = current_event_organizer.events.new(event_params)
    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      SendEventUpdateNotificationJob.perform_later(@event.id)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    head :no_content
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date, :venue)
  end
end
