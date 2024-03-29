class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_school_credential
    # Attempt to find a matching SchoolCredential
    credential = SchoolCredential.find_by_school_id_and_email(params[:user][:school_id])
    unless credential
      # If no credential is found, do not proceed with account creation
      build_resource(sign_up_params)
      resource.errors.add(:base, "Invalid registration. Please check your school ID and email.")
      respond_with_navigational(resource) { render :new }
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:school_id, :email, :password, :password_confirmation])
  end
end 