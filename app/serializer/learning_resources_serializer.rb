class LearningResourcesSerializer
  include JSONAPI::Serializer 
  set_id {nil}
  attributes :country, :video, :image
end