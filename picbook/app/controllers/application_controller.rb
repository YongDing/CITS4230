class ApplicationController < ActionController::Base
    include SessionsHelper
    
    
	def current_user
		@current = User.find(sessions[:user_id])
	end
    
    protected
  	
	def authorize
        unless User.find_by_id(session[:user_id])
            redirect_to login_url, :alert => "Please log in"
        end
    end
    protect_from_forgery
end
