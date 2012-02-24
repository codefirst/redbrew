require 'oauth2'
require 'json'
class LoginController < ApplicationController
  protect_from_forgery :only => ["logout"]

  def index
  end

  def oauth
    session[:oauth_referer] = request.referer

    callback_url = url_for(:controller => 'login', :action => 'oauth_callback')
    logger.info callback_url
    redirect_to client.auth_code.authorize_url(:redirect_uri => callback_url)
  end

  def oauth_callback
    code = params[:code]
    token = client.auth_code.get_token(code, :redirect_uri => session[:oauth_referer])
    oauth_user = JSON.parse(token.get('https://api.github.com/user').body)
    user = User.first(:conditions => {:github_name => oauth_user['login']})
    user ||= User.new
    user.github_name = oauth_user['login']
    user.name = oauth_user['name']
    user.icon_url = oauth_user['avatar_url']
    user.save
    
    session.delete :oauth_referer

    referer = session[:oauth_referer]
    session.delete :oauth_referer
    referer = url_for(:controller => 'plugins')
    redirect_to referer
  end

  def logout
    if request.post?
      session.delete :cached_current_user
      session.delete :current_user_id
    end
    redirect_to request.referer
  end

  private
  def client
    OAuth2::Client.new(
      Setting[:oauth_request_client_id],
      Setting[:oauth_request_client_secret],
      :site => 'https://github.com',
      :authorize_url => '/login/oauth/authorize',
      :token_url => '/login/oauth/access_token'
      )
  end
end
