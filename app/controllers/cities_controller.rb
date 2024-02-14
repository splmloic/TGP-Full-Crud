class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @users_in_city = User.where(city_id: @city.id)
    @gossips_in_city = Gossip.where(user_id: @users_in_city.pluck(:id))
  end
end
