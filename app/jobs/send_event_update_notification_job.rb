class SendEventUpdateNotificationJob < ApplicationJob
  queue_as :default

  def perform(event_id)
    event = Event.find(event_id)
    customers = event.bookings.map(&:customer)
    
    customers.each do |customer|
      # Send email notification logic for each customer
      puts "Email notification will be sent to customer #{customer.email} about the event update."
    end
  end
end
