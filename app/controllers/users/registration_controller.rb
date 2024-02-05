class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_school_credential, only: [:create]

  private

  def check_school_credential
    # Attempt to find a matching SchoolCredential
    credential = SchoolCredential.find_by_school_id_and_email(params[:user][:school_id], params[:user][:email])
    unless credential
      # If no credential is found, do not proceed with account creation
      build_resource(sign_up_params)
      resource.errors.add(:base, "Invalid registration. Please check your school ID and email.")
      respond_with_navigational(resource) { render :new }
    end
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :school_id)
  end
end
