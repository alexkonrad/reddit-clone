module ApplicationHelper
  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_token(session[:token])
  end

  def sign_in(user)
    @current_user = user
    session[:token] = user.reset_token!
  end

  def sign_out
    @current_user.try(:reset_token!)
    session[:token] = nil
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in!
    redirect_to new_session_url unless logged_in?
  end
end
