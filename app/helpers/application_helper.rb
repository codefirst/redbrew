module ApplicationHelper
  def login?
    not session[:current_user].nil?
  end
end
