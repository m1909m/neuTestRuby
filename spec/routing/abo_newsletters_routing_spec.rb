require "rails_helper"

RSpec.describe AboNewslettersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/abo_newsletters").to route_to("abo_newsletters#index")
    end

    it "routes to #new" do
      expect(:get => "/abo_newsletters/new").to route_to("abo_newsletters#new")
    end

    it "routes to #show" do
      expect(:get => "/abo_newsletters/1").to route_to("abo_newsletters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/abo_newsletters/1/edit").to route_to("abo_newsletters#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/abo_newsletters").to route_to("abo_newsletters#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/abo_newsletters/1").to route_to("abo_newsletters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/abo_newsletters/1").to route_to("abo_newsletters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/abo_newsletters/1").to route_to("abo_newsletters#destroy", :id => "1")
    end

  end
end
