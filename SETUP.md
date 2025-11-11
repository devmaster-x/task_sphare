# Task Share - Setup Guide

A full-stack project management application built with Rails API, React, and PostgreSQL.

## Tech Stack

- **Backend**: Rails 8.1 + PostgreSQL
- **Frontend**: React 19 + React Router
- **Styling**: Tailwind CSS
- **API**: RESTful JSON API with proper serialization

## Prerequisites

- Ruby 3.x
- Node.js 18+
- PostgreSQL 12+
- Git

## Backend Setup

```bash
cd api

# Install dependencies
bundle install

# Setup database
rails db:create
rails db:migrate
rails db:seed

# Start Rails server (port 3000)
rails server
```

## Frontend Setup

```bash
cd ui

# Install dependencies
npm install

# Start React dev server (port 3001)
npm start
```

## API Endpoints

### Projects
- `GET /api/v1/projects` - List all projects
- `POST /api/v1/projects` - Create project
- `GET /api/v1/projects/:id` - Get project
- `PUT /api/v1/projects/:id` - Update project
- `DELETE /api/v1/projects/:id` - Delete project

### Tasks
- `GET /api/v1/projects/:project_id/tasks` - List tasks
- `POST /api/v1/projects/:project_id/tasks` - Create task
- `PATCH /api/v1/projects/:project_id/tasks/:id` - Update task
- `DELETE /api/v1/projects/:project_id/tasks/:id` - Delete task

## Project Structure

```
api/
├── app/
│   ├── models/           # Rails models with validations
│   ├── controllers/      # API controllers
│   ├── serializers/      # JSON serializers
│   └── services/         # Business logic
└── db/
    └── migrate/          # Database migrations

ui/
├── src/
│   ├── api/              # API client
│   ├── pages/            # Page components
│   ├── components/       # Reusable components
│   └── App.js            # Main router
└── tailwind.config.js    # Tailwind configuration
```

## Key Features

✅ Clean, RESTful API design  
✅ Proper model associations and validations  
✅ React with React Router for navigation  
✅ Tailwind CSS for responsive UI  
✅ PostgreSQL with proper indexing  
✅ Error handling on both frontend and backend  
✅ Scalable architecture for senior-level code

