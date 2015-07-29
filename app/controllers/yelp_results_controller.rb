class YelpResultsController < ApplicationController

  def add_search_to_map
  	parameters = { term: params[:q], limit: 16 }
  	locale = { lang: 'en' }
  	@latitude = params[:latitude]
    @longitude = params[:longitude]
  	coordinates = { latitude: @latitude, longitude: @longitude }
  	new_search = YelpSearcher.new
    @businesses = new_search.get_results(coordinates, parameters, locale)
    # @results_all = new_search.get_results(coordinates, parameters, locale)
    # @results_all.get_sorted_results(coordinates, parameters, locale)
    render :map_view

  end
end
