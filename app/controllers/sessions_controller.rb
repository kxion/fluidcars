class SessionsController < ApplicationController
  
  def new
  end

  def create
	  user=User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		sign_in user
  		redirect_back
    else
      redirect_to login_url
  	end	
  end

  def destroy
  	sign_out
  	redirect_to root_url
  end

  def signup_or_signin
  end

end
