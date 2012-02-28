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
    @plugin.create_user = @user
    @plugin.update_user = @user
  end

  subject { @plugin }

  its(:create_user) { should == @user }
  its(:update_user) { should == @user }
end
