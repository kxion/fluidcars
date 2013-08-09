class SessionsController < ApplicationController  
  def new
  end

  def create
	  user=User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		sign_in user
  		redirect_back
    else
      flash[:notice] = '用户名或密码不正确'
      render action: 'new'
  	end	
  end

  def destroy
  	sign_out
  	redirect_to root_url
  end

end
