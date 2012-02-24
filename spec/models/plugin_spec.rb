require 'spec_helper'

describe Plugin do
  before do
    @plugin = Plugin.new(
      :id => 1,
      :name => 'some plugin',
      :url => 'http://example.com/plugin/',
      :desription => 'a plugin for redmine',
      :formula => 'script')
    @user = User.new(
      :id => 1,
      :name => 'test user',
      :github_name => 'test',
      :icon_url => 'http://example.com/icon.png')
    @plugin.user = @user
  end

  subject { @plugin }

  its(:user) { should == @user }
end
