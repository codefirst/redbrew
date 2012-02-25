require 'spec_helper'

describe LoginController do
  context "GET oauth" do
    before do
      get :oauth, {}
    end
    subject { response.redirect_url }
    it { should =~ /https:\/\/github.com\/login\/oauth\/authorize/ }
  end

  context "GET oauth" do
    before do
      client = mock
      auth_code = mock
      token = mock
      oauth_response = mock
      controller.stub(:client).and_return(client)
      client.stub(:auth_code).and_return(auth_code)
      auth_code.stub(:get_token).and_return(token)
      token.stub(:get).and_return(oauth_response)
      oauth_response.stub(:body).and_return('{"login":"user_id", "name":"user name", "avatar_url":"http://avator.url"}')

      get :oauth_callback, {:code => 'abcd'}
    end

    subject { response.redirect_url }

    it { should =~ /http:\/\/.*\/plugins/ }
  end
end
