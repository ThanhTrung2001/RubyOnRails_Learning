class SessionsController < ApplicationController 
    def new
    
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged In Successfully"
            redirect_to user
        else
            flash.now[:alert] = "There was something wrong"
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged Out"
        render 'new'
    end
    
end