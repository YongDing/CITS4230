class SessionsController < ApplicationController
    skip_before_filter :authorize
    def new
    end

    def create
        if user = User.authenticate(params[:email], params[:password])
            session[:user_id] = user.id
            redirect_to :controller => 'users', :action => 'show', :id => user.id
            else
            redirect_to login_url, :alert => "Invalid user/password combination"
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to :controller => 'picbook', :action => 'index'
    end
  
end
