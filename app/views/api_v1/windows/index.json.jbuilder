json.countries_count @countries.count
json.countries do
  json.array!(@countries) do |country|
    json.name country.name
    json.cities_country = country.cities.count
    json.cities do
      json.array!(country.cities) do |city|
        json.name city.name
        json.latitude city.latitude
        json.longitude city.longitude
        json.window_count city.windows.count
        json.window do
          json.array!(city.windows) do |window|
            json.id window.id
            json.name window.name
            json.latitude window.latitude
            json.longitude window.longitude
            json.image_url asset_url(window.images.last.image.url)
            json.audio_url asset_url(window.audios.last.audio.url)
            json.video_url window.videos.first.video_file_name
            json.quote @quote.content
            json.author @quote.author
          end
        end
      end
    end
  end
end
