class YelpResultsController < ApplicationController

  def add_search_to_map

  #GENERAL SEARCH
  	parameters = { term: params[:q], limit: 16 }
  	locale = { lang: 'en' }
  	@latitude = params[:latitude]
    @longitude = params[:longitude]
  	coordinates = { latitude: @latitude, longitude: @longitude }

  # YELP
  	new_search = YelpSearcher.new
    @businesses = new_search.get_results(coordinates, parameters, locale)

  # MEETUP
    new_search_meetup = MeetupSearcher.new
    @meetups = new_search_meetup.get_meetup_results(coordinates, parameters)

    render :map_view

  end

end
