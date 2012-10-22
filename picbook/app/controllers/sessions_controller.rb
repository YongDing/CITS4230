class SessionsController < ApplicationController
    skip_before_filter :authorize
    def new
    end

    def create
        user = User.where("email = ?", params[:email])
        if user and user.authenticate?(params[:password])
            session[:user_id] = user.id
            redirect_to user_url(session[:user_id])
        else
            redirect_to login_url, :alert=> "Password/User name incorrect"
        end
        
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to login_url
    end
  
end
