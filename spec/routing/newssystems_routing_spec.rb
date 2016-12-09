require "rails_helper"

RSpec.describe NewssystemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/newssystems").to route_to("newssystems#index")
    end

    it "routes to #new" do
      expect(:get => "/newssystems/new").to route_to("newssystems#new")
    end

    it "routes to #show" do
      expect(:get => "/newssystems/1").to route_to("newssystems#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/newssystems/1/edit").to route_to("newssystems#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/newssystems").to route_to("newssystems#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/newssystems/1").to route_to("newssystems#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/newssystems/1").to route_to("newssystems#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/newssystems/1").to route_to("newssystems#destroy", :id => "1")
    end

  end
end
