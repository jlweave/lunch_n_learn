class LearningResource
  attr_reader :country, :video, :image

  def initialize(country, video, image)
    @country = country
    @video = video
    @image = image
  end
end