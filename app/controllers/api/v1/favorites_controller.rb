class Api::V1::FavoritesController < ApplicationController
   before_action :find_user, only: [:create, :index]
   
  def create
     if @user
      if @user.favorites.create!(favorite_params).save
        render json: { "success": "Favorite was added to user" }, status: 201
      end
    else
      render json: { "errors": "User could not be found, favorite not added. Try again!" }, status: 400
    end
  end

  def index
    if @user
      render json: FavoritesSerializer.new(@user.favorites), status:201
    else
      render json: { "errors": "User could not be found, try again." }, status: 400
    end
  end

  private
  def favorite_params
    params.permit(:user_api_key, :country, :recipe_link, :recipe_title)
  end

  def find_user
    @user = User.find_by(user_api_key: params[:user_api_key])
  end
end