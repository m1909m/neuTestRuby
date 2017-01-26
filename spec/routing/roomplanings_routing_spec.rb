require "rails_helper"

RSpec.describe RoomplaningsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/roomplanings").to route_to("roomplanings#index")
    end

    it "routes to #new" do
      expect(:get => "/roomplanings/new").to route_to("roomplanings#new")
    end

    it "routes to #show" do
      expect(:get => "/roomplanings/1").to route_to("roomplanings#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/roomplanings/1/edit").to route_to("roomplanings#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/roomplanings").to route_to("roomplanings#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/roomplanings/1").to route_to("roomplanings#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/roomplanings/1").to route_to("roomplanings#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/roomplanings/1").to route_to("roomplanings#destroy", :id => "1")
    end

  end
end
