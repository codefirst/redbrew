require 'spec_helper'

describe "plugins/edit" do
  before(:each) do
    @plugin = assign(:plugin, stub_model(Plugin,
      :name => "MyString",
      :url => "MyString",
      :desription => "MyString",
      :formula => 1,
      :user_id => 1
    ))
  end

  it "renders the edit plugin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => plugins_path(@plugin), :method => "post" do
      assert_select "input#plugin_name", :name => "plugin[name]"
      assert_select "input#plugin_url", :name => "plugin[url]"
      assert_select "input#plugin_desription", :name => "plugin[desription]"
      assert_select "input#plugin_formula", :name => "plugin[formula]"
      assert_select "input#plugin_user_id", :name => "plugin[user_id]"
    end
  end
end
