require 'rails_helper'

RSpec.describe "Windows", type: :request do
  describe "GET /windows" do
    it "works! (now write some real specs)" do
      get v1_windows_path
      expect(response).to have_http_status(200)
    end
  end
end
