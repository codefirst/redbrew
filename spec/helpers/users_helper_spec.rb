require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe UsersHelper do
  context 'link_to_github' do
    before do
      session[:current_user] = User.new(:name => 'test user', :github_name => 'test')
    end

    context 'link_to_github' do
      it { link_to_github(session[:current_user]).should == '<img alt="Images" src="/images/" width="16px" /><a href="https://github.com/test">test user</a>' }
    end
  end

end
