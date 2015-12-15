class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  
private  

def require_user
        unless current_user
            store_location
            flash[:notice] = "You must be logged in to access this page"
            redirect_to new_user_session_url
            return false
        end
    end

def current_user_session  
  return @current_user_session if defined?(@current_user_session)  
  @current_user_session = UserSession.find  
end  
  
def current_user  
  @current_user = current_user_session && current_user_session.record  
end  
def store_location
    session[:user_return_to] = request.referer
  end
end