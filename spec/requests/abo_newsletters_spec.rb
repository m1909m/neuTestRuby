require 'rails_helper'

RSpec.describe "AboNewsletters", type: :request do
  describe "GET /abo_newsletters" do
    it "works! (now write some real specs)" do
      get abo_newsletters_path
      expect(response).to have_http_status(200)
    end
  end
end
