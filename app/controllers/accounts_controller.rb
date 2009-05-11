class AccountsController < ApplicationController

  skip_before_filter :set_locale, :only => :set_user_locale

  def set_user_locale		
		cookies[:locale] = { :value => params[:locale], :expires => 1.year.from_now }
		I18n.locale = params[:locale]
		redirect_to :back
  end

end
