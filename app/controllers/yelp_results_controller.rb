class YelpResultsController < ApplicationController

  def search
    parameters = { term: params[:q], limit: 16 }
    locale = { lang: 'en' }
    @latitude = params[:latitude]
    @longitude = params[:longitude]
    coordinates = { latitude: @latitude, longitude: @longitude }
		# render json: Yelp.client.search_by_coordinates(coordinates, parameters, locale)
	render :map_view
  end

  def show_map
  	render :map_view
  end

end


