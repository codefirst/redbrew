require 'spec_helper'

describe "Plugins" do
  describe "GET /plugins" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get plugins_path
      response.status.should be(200)
    end
  end
end
