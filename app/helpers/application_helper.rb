module ApplicationHelper
  def login?
    not session[:current_user].nil?
  end
  def current_user
    session[:current_user]
  end
end
