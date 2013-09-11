class SessionsController < ApplicationController  
  def new
  end

  def create
    if request.env['omniauth.auth'].nil?
      flash[:notice] = '信息输入有误'
      render new
    else
      user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in user
      flash[:notice] = "登录成功!"
      redirect_to root_url
    end
  end

  def destroy
    sign_out
    flash[:notice] = "已注销！"
    redirect_to root_url
  end

  def failure
    flash[:notice] = '用户名或密码不正确，请重新输入'
    render 'new'
  end

end
