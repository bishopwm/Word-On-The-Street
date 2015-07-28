class YelpResultsController < ApplicationController

  def add_search_to_map
  	parameters = { term: params[:q], limit: 16 }
  	locale = { lang: 'en' }
  	@latitude = params[:latitude]
    @longitude = params[:longitude]
  	coordinates = { latitude: @latitude, longitude: @longitude }
  	new_search = YelpSearcher.new
    @results = new_search.get_results(coordinates, parameters, locale)

	
    render :map_view
  end
end
