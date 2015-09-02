class YelpResultsController < ApplicationController
  def add_search_to_map
    @search_term = params[:q]

  #GENERAL SEARCH
  	parameters = { term: params[:q], limit: 16 }
  	locale = { lang: 'en' }
    twitter_term = { :term => params[:q] }
  	@latitude = params[:latitude]
    @longitude = params[:longitude]
    latitude = params[:latitude]
    longitude = params[:longitude]

    city_coordinates = latitude + "," + longitude
  	coordinates = { latitude: @latitude, longitude: @longitude }
    user_city = Geocoder.search(city_coordinates)[0].data["address_components"][2]["long_name"]


  # YELP
  	new_search = YelpSearcher.new
    @businesses = new_search.get_results(coordinates, parameters, locale)

  # MEETUP
    new_search_meetup = MeetupSearcher.new
    @meetups = new_search_meetup.get_meetup_results(coordinates, parameters)

  # TWITTER
    new_search_twitter = TwitterSearcher.new
    @tweets = new_search_twitter.get_twitter_results(twitter_term, latitude, longitude, user_city)
    # @timeline = new_search_twitter.prepare_access_token(oauth_token, oauth_token_secret)
    oauth_token = User.last.access_token
    oauth_token_secret = User.last.access_secret


  # INSTAGRAM
    new_search_insta = InstaSearcher.new
    @instas = new_search_insta.get_insta_results(coordinates, parameters)

  # FACBOOK
    new_search_facebook = FacebookSearcher.new
    
      @facebook_events = new_search_facebook.get_facebook_results(user_city, parameters)

    render :map_view

  end

end
