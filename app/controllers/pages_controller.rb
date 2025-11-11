class PagesController < ApplicationController
  # Serve React SPA for all routes
  def index
    render :index
  end
end

