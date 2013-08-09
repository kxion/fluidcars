class UsersController < ApplicationController

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      notice = "注册成功"
      redirect_back
    else
      render action: "new"  
    end
  end

end
