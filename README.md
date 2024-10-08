# Gyms-API

Gyms-API is a Ruby on Rails application that provides a backend API for managing gym memberships, payments, and equipment reservations.

## Features

- Member management
- Membership plans and statuses
- Payment processing
- Usage history tracking
- Equipment reservation system
- JWT-based authentication

## Prerequisites

- Ruby 3.2.2
- Rails 7.0.8
- MySQL 8.0.34
- Docker

## Getting Started

1. Clone the repository:
   ```
   git clone https://github.com/ElGraam/Gyms-Api.git
   cd Gyms-Api
   ```

## Environment Setup

### Build
```bash
docker compose build --no-cache
```

### Start the containers
```bash
docker compose up
```

### Set up the database
First, access the web container:
```bash
docker compose exec web sh
```

Then, inside the container, run:
```
rails db:create
rails db:migrate
rails db:seed
```

Verify that the project is running by accessing http://localhost:3000/ in your browser.

The API will be available at `http://localhost:3000`.

## Docker

This project includes a `docker-compose.yml` file for easy deployment. To run the application using Docker:

```
docker compose up
```

## API Endpoints

- `/login` - User authentication
- `/members` - Member management
- `/payments` - Payment processing
- `/payment_methods` - Payment method management
- `/membership_plans` - Membership plan management
- `/membership_statuses` - Membership status management
- `/usage_histories` - Usage history tracking
- `/equipment_reservations` - Equipment reservation management

For detailed API documentation, please refer to the `openapi.yaml` file in the project root.

## Authentication

This API uses JWT (JSON Web Tokens) for authentication. To access protected endpoints, include the JWT token in the Authorization header of your requests:

```
Authorization: Bearer <your-jwt-token>
