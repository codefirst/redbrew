require 'spec_helper'

describe "plugins/index" do
  before(:each) do
    assign(:plugins, [
      stub_model(Plugin,
        :name => "Name",
        :url => "Url",
        :desription => "Desription",
        :formula => 1,
        :user_id => 1
      ),
      stub_model(Plugin,
        :name => "Name",
        :url => "Url",
        :desription => "Desription",
        :formula => 1,
        :user_id => 1
      )
    ])
  end

  it "renders a list of plugins" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Desription".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
