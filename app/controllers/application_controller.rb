# encoding: utf-8

class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception


  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || "/zugangsbereich"
  end




  def authenticate_admin_user!

    redirect_to new_user_session_path unless can?(:manage, :all)

  end



  rescue_from CanCan::AccessDenied do |exception|

    redirect_to root_url, :alert => exception.message

  end



  after_action :set_csrf_cookie_for_ng



  def set_csrf_cookie_for_ng

    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?

  end



  protected



  def verified_request?

    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])

  end

end



