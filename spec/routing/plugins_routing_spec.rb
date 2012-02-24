require "spec_helper"

describe PluginsController do
  describe "routing" do

    it "routes to #index" do
      get("/plugins").should route_to("plugins#index")
    end

    it "routes to #new" do
      get("/plugins/new").should route_to("plugins#new")
    end

    it "routes to #show" do
      get("/plugins/1").should route_to("plugins#show", :id => "1")
    end

    it "routes to #edit" do
      get("/plugins/1/edit").should route_to("plugins#edit", :id => "1")
    end

    it "routes to #create" do
      post("/plugins").should route_to("plugins#create")
    end

    it "routes to #update" do
      put("/plugins/1").should route_to("plugins#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/plugins/1").should route_to("plugins#destroy", :id => "1")
    end

  end
end
