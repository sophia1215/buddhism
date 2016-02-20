class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def after_sign_in_path_for(resource)
    has_contact_info = MemberContact.find_by(member_id: current_member.id)
    if !has_contact_info.nil?
      if !session[:return_to].nil?
        session[:return_to]
        # session.delete[:return_to]
        session.delete(:return_to)
      else
        edit_member_path(current_member.id)
      end
    else
      edit_member_path(current_member.id)
    end
  end

  protected

  # To permit new custom attributes to be verified as attributes permitted by the form
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
  end
end
