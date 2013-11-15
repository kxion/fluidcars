module SessionsHelper
  def sign_in(user)
    session[:user_id] = user._id
  	current_user = user
  end

  def signed_in?
  	!session[:user_id].nil? && !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def current_user?(user)
    user == current_user
  end

  def signed_in_user
    unless signed_in?
      reset_session
      store_location
      flash[:warning] = '需要登录!'
      redirect_to login_url
    end
  end

  def sign_out
    current_user = nil
    # session[:user_id] = nil
    reset_session()
  end

  def redirect_back
    if session[:back_path_to]
      redirect_to session[:back_path_to]
      session.delete(:back_path_to)
    else
      redirect_to root_url
    end
  end

  def store_location(path = request.referer)
    session[:back_path_to] = path
  end

  def signed_admin
    unless current_user.email == 'admin@admin.com'
      redirect_to root_url
    end
  end
end
