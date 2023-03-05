class Favorite < ApplicationRecord
  belongs_to :user

  validates_presence_of :country
  validates_presence_of :recipe_link
  validates_presence_of :recipe_title
  validates_presence_of :user_id
  validates_presence_of :user_api_key

 
end