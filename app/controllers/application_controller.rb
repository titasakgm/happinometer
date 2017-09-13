class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :store_current_location, :unless => :devise_controller?

  private
  # override the devise helper to store the current location so we can
  # redirect to it after loggin in or out. This override makes signing in
  # and signing up work automatically.

  def store_current_location
    store_location_for(:user, request.url)
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def store_location
    return nil
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    if (request.fullpath != "/users/sign_in" &&
      request.fullpath != "/users/sign_up" &&
      request.fullpath != "/users/password" &&
      request.fullpath != "/users/sign_out" &&
      !request.xhr?) # don't store ajax calls
      session["user_return_to"] = request.fullpath 
    end
  end

  def check_current_user
    if current_user.nil?
      redirect_to new_user_session_path
      return
    end
  end

end
