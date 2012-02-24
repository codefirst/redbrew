require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :github_name => "Github Name",
      :icon_url => "Icon Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Github Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Icon Url/)
  end
end
