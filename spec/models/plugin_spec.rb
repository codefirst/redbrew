require 'spec_helper'

describe Plugin do
  context 'association' do
    before do
      @plugin = Plugin.new(
        :id => 1,
        :name => 'some plugin',
        :url => 'http://example.com/plugin/',
        :description => 'a plugin for redmine',
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

  context 'uniqueness' do
    before do
      @plugin1 = Plugin.new(:name => 'test')
      @plugin2 = Plugin.new(:name => 'test')
    end

    it 'error raised when save same plugin' do
      lambda {
        @plugin1.save!
        @plugin2.save!
      }.should raise_error
    end
  end

  context 'search by id' do
    before do
      Plugin.new(:name => 'test').save
      @test_plugin = Plugin.find_by_name('test')
    end

    subject { Plugin.find('test') }

    it { should == @test_plugin }
  end

  context 'empty name plugin' do
    before do
      @plugin = Plugin.new(:name => '')
    end

    it 'cannot be saved' do
      lambda {
        @plugin.save!
      }.should raise_error
    end
  end

  context 'constract search condition' do
    subject { Plugin.search_by_keywords(' aaa  bbb ') }

    its(:to_sql) { should == "SELECT \"plugins\".* FROM \"plugins\"  WHERE (plugins.deleted_at IS NULL) AND ((((\"plugins\".\"name\" LIKE '%aaa%' OR \"plugins\".\"url\" LIKE '%aaa%') OR \"plugins\".\"description\" LIKE '%aaa%') OR \"plugins\".\"formula\" LIKE '%aaa%')) AND ((((\"plugins\".\"name\" LIKE '%bbb%' OR \"plugins\".\"url\" LIKE '%bbb%') OR \"plugins\".\"description\" LIKE '%bbb%') OR \"plugins\".\"formula\" LIKE '%bbb%'))" }
  end
end
