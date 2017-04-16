require 'rails_helper'

RSpec.describe "NewsContents", type: :request do
  describe "GET /news_contents" do
    it "works! (now write some real specs)" do
      get news_contents_path
      expect(response).to have_http_status(200)
    end
  end
end
