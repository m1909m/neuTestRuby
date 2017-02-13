require 'rails_helper'

RSpec.describe "CEvents", type: :request do
  describe "GET /c_events" do
    it "works! (now write some real specs)" do
      get c_events_path
      expect(response).to have_http_status(200)
    end
  end
end
