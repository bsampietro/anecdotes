# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "master"

  helper :all # include all helpers, all the time
  
  helper_method :current_user, :logged_in?, :admin_logged?
  
  before_filter :set_locale
  
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  protected
  
  def current_user
	  logged_in? ?
  	  @current_user ||= User.find(session[:user_id]) : User.new {|user| user.id = ANONYMOUS_USER_ID; user.nick = "anonymous"}
  end
  
  def logged_in?
    !session[:user_id].nil?
  end
  
  def admin_logged?
    session[:is_admin]
  end
  
  def set_locale
  	I18n.locale = cookies[:locale] || I18n.default_locale
  end
  
end
