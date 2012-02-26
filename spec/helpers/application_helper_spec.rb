require 'spec_helper'

describe ApplicationHelper do
  context 'logged-in' do
    before do
      session[:current_user] = User.new(:name => 'test user', :github_name => 'test')
    end

    context 'is logged' do
      subject { login? }
      it { should == true }
    end

    context 'get current user' do
      subject { current_user }
      its(:github_name) { should == 'test' }
    end
  end

  context 'not logged-in' do
    before do
      session[:current_user] = nil
    end

    context 'is logged' do
      subject { login? }
      it { should == false }
    end

    context 'get current user' do
      subject { current_user }
      it { should be_nil }
    end
  end
end
