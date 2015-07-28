class YelpSearcher

	def get_results(coordinates, parameters, locale)
		yelp_search = Yelp.client.search_by_coordinates(coordinates, parameters, locale)
		name = yelp_search.businesses[2].name
		category = yelp_search.businesses[2].categories[0][0]
		business_latitude = yelp_search.businesses[2].location.coordinate.latitude
		business_longitude = yelp_search.businesses[2].location.coordinate.longitude
		business_coordinates = [business_latitude, business_longitude]

	end

	# def sort_results
	# 	@search_results.each do |result|
	# 		result[0].businesses.name
	# 	end
	# end
end

