module SessionsHelper
  def sign_in(user)
    session[:user_id] = user.id
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
      store_location
      redirect_to login_url, notice: "Please sign in."
    end
  end

  def sign_out
    current_user = nil
    session[:user_id] = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end

  def signed_admin
    unless current_user.email == 'admin@admin.com'
      redirect_to root_url
    end
  end
end
