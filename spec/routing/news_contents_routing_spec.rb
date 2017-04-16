require "rails_helper"

RSpec.describe NewsContentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/news_contents").to route_to("news_contents#index")
    end

    it "routes to #new" do
      expect(:get => "/news_contents/new").to route_to("news_contents#new")
    end

    it "routes to #show" do
      expect(:get => "/news_contents/1").to route_to("news_contents#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/news_contents/1/edit").to route_to("news_contents#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/news_contents").to route_to("news_contents#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/news_contents/1").to route_to("news_contents#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/news_contents/1").to route_to("news_contents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/news_contents/1").to route_to("news_contents#destroy", :id => "1")
    end

  end
end
