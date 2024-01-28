class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # Display the dashboard view for authenticated users
    # The view 'dashboard/index.html.erb' will be rendered
  end
end
