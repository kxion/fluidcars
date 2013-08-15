class SessionsController < ApplicationController  
  def new
  end

  def create
    if request.env['omniauth.auth'].nil?
      render new
    else
      user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in user
      redirect_to root_url, notice: "登录成功!"
    end
  end

  def destroy
    sign_out
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    flash[:notice] = '用户名或密码不正确，请重新输入'
    render 'new'
  end

end
