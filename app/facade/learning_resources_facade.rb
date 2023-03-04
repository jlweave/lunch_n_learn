class LearningResourcesFacade
  def self.country_resources(country)
    video = VideosFacade.specific_country_video(country)
    image = ImagesFacade.specific_country_image(country)
    LearningResource.new(country, video, image)
  end
end