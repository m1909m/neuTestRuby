require 'rails_helper'

RSpec.describe "Roomplanings", type: :request do
  describe "GET /roomplanings" do
    it "works! (now write some real specs)" do
      get roomplanings_path
      expect(response).to have_http_status(200)
    end
  end
end
