class SessionsController < ApplicationController
  def create
	user=User.find_by_email(params[:email])
	if user && user.authenticate(params[:password])
		sign_in user
		redirect_back_or(root_url)
	else
		redirect_to login_url	
	end	
  end

  def destroy
  	sign_out
  	redirect_to root_url
  end
end
