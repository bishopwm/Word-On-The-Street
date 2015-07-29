class YelpSearcher

	def get_results(coordinates, parameters, locale)
		# yelp_search = Yelp.client.search_by_coordinates(coordinates, parameters, locale)
		# businesses = yelp_search.businesses
		# name = yelp_search.businesses[2].name
		# category = yelp_search.businesses[2].categories[0][0]
		# latitude = yelp_search.businesses[2].location.coordinate.latitude
		# longitude = yelp_search.businesses[2].location.coordinate.longitude
		# coordinates = [latitude, longitude]
		# address = yelp_search.businesses[2].location.address[0]
		# [name, category, address, coordinates]


		
		nearby_businesses = []


		Yelp.client.search_by_coordinates(coordinates, parameters, locale).businesses.each do |business|
			nearby_businesses << {
				:coordinates => [business.location.coordinate.latitude, business.location.coordinate.longitude],
				:address => business.location.address,
				:name => business.name
			}

		end
		
		nearby_businesses
	end


end


