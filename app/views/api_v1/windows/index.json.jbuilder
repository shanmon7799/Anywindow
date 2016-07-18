json.data do
    json.country do
    json.name "台灣"
    json.cities_count 1
    json.city do
      json.name "台北"
      json.latitude "25.0171604"
      json.longitude "121.3659518"
      json.windows_count 1
      json.window do
        json.id 1
        json.name "AlphaCamp"
        json.latitude "25.052299"
        json.longitude "121.530065"
        json.image_original_url asset_url("test_original_url")
        json.image_medium_url asset_url("test_medium_url")
        json.image_thumb_url asset_url("test_thumb_url")
        json.audio_url asset_url("test_audio_url")
        json.video_url asset_url("test_video_url")
        json.is_visited false
        json.quoto "格言"
      end
    end
  end
end