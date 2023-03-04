class LearningResourcesFacade
  def self.country_resources(country)
    video = VideosFacade.specific_country_video(country)
    LearningResource.new(country, video)
  end
end