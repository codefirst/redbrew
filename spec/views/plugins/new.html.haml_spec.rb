require 'spec_helper'

describe "plugins/new" do
  before(:each) do
    assign(:plugin, stub_model(Plugin,
      :name => "MyString",
      :url => "MyString",
      :desription => "MyString",
      :formula => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new plugin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => plugins_path, :method => "post" do
      assert_select "input#plugin_name", :name => "plugin[name]"
      assert_select "input#plugin_url", :name => "plugin[url]"
      assert_select "input#plugin_desription", :name => "plugin[desription]"
      assert_select "input#plugin_formula", :name => "plugin[formula]"
      assert_select "input#plugin_user_id", :name => "plugin[user_id]"
    end
  end
end
