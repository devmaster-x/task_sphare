#!/bin/bash
# PostgreSQL Setup Script for Rails Application
# This script creates the necessary PostgreSQL role for the current user

echo "Creating PostgreSQL role for user: $USER"
sudo -u postgres createuser -s $USER

echo "PostgreSQL role created successfully!"
echo "You can now run: rails db:create db:migrate db:seed"

