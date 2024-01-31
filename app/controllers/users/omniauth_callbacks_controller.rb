class Users::OmniauthCallbacksController < ApplicationController
  def google_oauth2
    Rails.logger.info "Scopes: #{request.env['omniauth.auth']['info']['scopes']}"
    
    Rails.logger.info "Access Type: #{request.env['omniauth.auth']['info']['access_type']}"
    
    Rails.logger.info "Redirect URI: #{request.env['omniauth.auth']['redirect_uri']}"
    user = User.from_google(auth)

    if user.persisted?
      sign_out_all_scopes
      flash[:notice] = t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      redirect_to new_user_session_path
    end
  end

  private

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
