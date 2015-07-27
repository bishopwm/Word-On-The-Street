class YelpResultsController < ApplicationController

	def search
    parameters = { term: params[:q], limit: 16 }
    locale = { lang: 'en' }
    coordinates = { latitude: params[:latitude], longitude: params[:longitude] }
		render json: Yelp.client.search_by_coordinates(coordinates, parameters, locale)
  end
end


