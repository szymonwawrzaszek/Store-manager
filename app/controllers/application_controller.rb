class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  #def current_user
  #  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end
  #helper_method :current_user

  def is_admin?
    redirect_to stores_path, notice: 'Not admin' if  current_user.nil? || current_user.user_type!='admin'
  end
  def is_customer?
    redirect_to stores_path, notice: "Not customer" if  current_user.nil?||(current_user.user_type!='customer')&&(current_user.user_type!='admin')
  end
  def is_store?
    redirect_to stores_path, nitice: "Not store" if current_user.nil?||(current_user.user_type!='store')&&(current_user.user_type!='admin')
  end
  def is_warehouse?
    redirect_to stores_path, notice: "Not warehouse" if  current_user.nil?||(current_user.user_type!='warehouse'&&current_user.user_type!='admin')
  end
end
