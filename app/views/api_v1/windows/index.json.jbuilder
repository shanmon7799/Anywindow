 json.data do
  json.countries_count @countries.count
  json.array!(@countries) do |country|
    json.name country.name
    json.cities_country = country.cities.count
    json.array!(country.cities) do |city|
      json.name city.name
      json.latitude city.latitude
      json.longitude city.longitude
      json.windows_count city.windows.count
      json.array!(city.windows) do |window|
        json.id window.id
        json.name window.name
        json.latitude window.latitude
        json.longitude window.longitude
        json.image_url asset_url("window.image.image.url")
        json.audio_url asset_url("window.audi.audio.url")
        json.video_url asset_url("window.video.video.url")
        json.is_visited windows.users ? true : false
        json.quote @quote
      end
    end
  end
end