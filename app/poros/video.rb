class Video
  attr_reader :title, :video_id
  
  def initialize(data)
    @title = data[]
    @video_id = data[]
  end
end