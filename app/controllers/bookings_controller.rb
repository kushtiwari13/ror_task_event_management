class BookingsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets.find(params[:ticket_id])
    @booking = current_customer.bookings.new(event: @event, ticket: @ticket)

    if @booking.save
      SendEmailConfirmationJob.perform_later(customer_id: @booking.customer.id)
      render json: @booking, status: :created
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end
end