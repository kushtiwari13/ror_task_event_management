# Event Management API

This is an API-only application for managing events and bookings. It includes authentication for event organizers and customers, and supports CRUD operations for events and bookings.

## Getting Started

To run the application locally, follow these steps:

1. Clone the repository:
   ```
   git clone https://github.com/kushtiwari13/ror_task_event_management
   ```

2. Install the required dependencies:
   ```
   bundle install
   ```

3. Set up the database:
   ```
   rails db:create
   rails db:migrate
   ```

4. Start the Rails server:
   ```
   rails s
   ```

Now, your application will be running locally, and you can access it via `http://localhost:3000`.

## API Endpoints
### Authentication Endpoints:

- **POST /event_organizers/sign_up**  
  Used to register a new event organizer.  
  **Input format:**
  ```json
  {
    "event_organizer": {
      "email": "organizer@example.com",
      "password": "password123",
      "password_confirmation": "password123"
    }
  }
  ```

- **POST /event_organizers/sign_in**  
  Used for event organizers to log in.  
  **Input format:**
  ```json
  {
    "event_organizer": {
      "email": "organizer@example.com",
      "password": "password123"
    }
  }
  ```

- **POST /customers/sign_up**  
  Used to register a new customer.  
  **Input format:**
  ```json
  {
    "customer": {
      "email": "customer@example.com",
      "password": "password123",
      "password_confirmation": "password123"
    }
  }
  ```

- **POST /customers/sign_in**  
  Used for customers to log in.  
  **Input format:**
  ```json
  {
    "customer": {
      "email": "customer@example.com",
      "password": "password123"
    }
  }
  ```


### Event Endpoints:

- **GET /events**  
  Retrieves a list of all events.

- **POST /events**  
  Creates a new event.  
  **Input format:**
  ```json
  {
    "event": {
      "name": "Event Name",
      "date": "2025-04-01",
      "location": "Event Location",
      "description": "Event Description"
    }
  }
  ```

- **GET /events/:id**  
  Retrieves details of a specific event by ID.

- **PUT /events/:id**  
  Updates a specific event by ID.  
  **Input format:**
  ```json
  {
    "event": {
      "name": "Updated Event Name",
      "date": "2025-05-01",
      "location": "Updated Location",
      "description": "Updated Description"
    }
  }
  ```

- **DELETE /events/:id**  
  Deletes a specific event by ID.

### Booking Endpoints:

- **POST /events/:event_id/bookings**  
  Books a spot for a customer for a specific event.  
  **Input format:**
  ```json
  {
    "booking": {
      "customer_id": "customer_id_here"
    }
  }
  ```

- **GET /events/:event_id/bookings**  
  Retrieves a list of all bookings for a specific event.

- **DELETE /bookings/:id**  
  Cancels a specific booking by ID.

---

Let me know if you need further adjustments!
