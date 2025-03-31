class SendEmailConfirmationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Email confirmation will be sent to customer after booking."
  end
end
