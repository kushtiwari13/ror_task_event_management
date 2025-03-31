Rails.application.routes.draw do
  devise_for :event_organizers
  devise_for :customers

  # Events routes with full CRUD operations
  resources :events do
    resources :bookings, only: [:create] # Nested booking creation inside events
  end

  # Custom routes for event-related actions
  get '/events/:id/tickets', to: 'events#tickets', as: 'event_tickets'
  get '/upcoming_events', to: 'events#upcoming'

  # Root route (optional, you can change this)
  root "events#index"
end
