require 'rails_helper'

RSpec.describe "Windows", type: :request do
  describe "GET /windows" do
    it "should be return windows json" do
      user = User.create!( email: "test@example.org", password: "12345678")

      get v1_windows_path
      data = {
      "data" => {
           "country" => {
                   "name" => "台灣",
                   "cities_count" => 1,
                   "city" => {
                        "name" => "台北",
                        "latitude" => "25.0171604",
                        "longitude" => "121.3659518",
                        "windows_count" => 1,
                        "window" => {
                               "id" =>1,
                               "name" => "AlphaCamp",
                               "latitude" => "25.052299",
                               "longitude" => "121.530065",
                               "image_original_url" => "http://www.example.com/test_original_url",
                               "image_medium_url" => "http://www.example.com/test_medium_url",
                               "image_thumb_url" => "http://www.example.com/test_thumb_url",
                               "audio_url" => "http://www.example.com/test_audio_url",
                               "video_url" => "http://www.example.com/test_video_url",
                               "is_visited" =>false,
                               "quoto" => "格言"
                             }
                           }
                         }
                       }
                      }

      parsed_json = JSON.parse( response.body )

      expect(parsed_json).to eq(data)
    end
  end

  describe "GET /windows/:id" do
    it "should save successfully" do
      user = User.create!( email: "test@example.org", password: "12345678")
      window = Window.create!(name: "test")

      get v1_window_path(window)

      expect(response.status).to eq(200)
    end
  end

  describe "PATCH /windows/:id" do
    it "should update successfully" do
      user = User.create!( email: "test@example.org", password: "12345678")
      window = Window.create!(name: "test")
      patch v1_window_path(window , is_broken: true)

      expect(response.status).to eq(200)
    end

    it "should update failed" do
      user = User.create!( email: "test@example.org", password: "12345678")
      window = Window.create!(name: "test")

      patch v1_window_path(window)

      expect(response.status).to eq(400)
    end
  end
end
