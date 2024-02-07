class ApplicationController < ActionController::Base
  # This method is called by Devise after a successful sign-in
  def after_sign_in_path_for(resource)
    # Check if the resource (user) has a specific role
    if resource.admin?
      # Redirect admin users to the admin dashboard
      admin_dashboard_path
    elsif resource.student?
      # Redirect student users to the student dashboard
      students_dashboard_path
    else
      # Redirect to a default path if neither
      root_path
    end
  end
end
