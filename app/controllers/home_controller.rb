class HomeController < ApplicationController
  # Ensure the landing page is accessible to everyone without requiring login
#   skip_before_action :authenticate_user!, only: [:index], raise: false

  before_action :authenticate_user!
  
  def index
  end
end