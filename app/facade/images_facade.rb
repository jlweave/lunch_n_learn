class ImagesFacade
  def self.specific_country_image(country)
    results = ImagesService.find_country_images(country)
    results.map do |result|
      Image.new(result)
    end
  end
end