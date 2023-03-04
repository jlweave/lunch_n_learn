class VideosFacade

  def self.specific_country_video(country)
    results = VideosService.find_country_video(country)
  end
end