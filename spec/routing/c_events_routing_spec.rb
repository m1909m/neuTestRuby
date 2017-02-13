require "rails_helper"

RSpec.describe CEventsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/c_events").to route_to("c_events#index")
    end

    it "routes to #new" do
      expect(:get => "/c_events/new").to route_to("c_events#new")
    end

    it "routes to #show" do
      expect(:get => "/c_events/1").to route_to("c_events#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/c_events/1/edit").to route_to("c_events#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/c_events").to route_to("c_events#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/c_events/1").to route_to("c_events#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/c_events/1").to route_to("c_events#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/c_events/1").to route_to("c_events#destroy", :id => "1")
    end

  end
end
