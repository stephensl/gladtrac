module Admin
  class DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin

    def index
      # Logic for admin dashboard
    end

    private

    def check_admin
      # Ensure the current user is an admin
      redirect_to root_path, alert: "Access denied." unless current_user.admin?
    end
  end
end
