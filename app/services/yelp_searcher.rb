class YelpSearcher

	def get_results(coordinates, parameters, locale)
		
		nearby_businesses = []


		Yelp.client.search_by_coordinates(coordinates, parameters, locale).businesses.each do |business|
			nearby_businesses << {

				:coordinates => [business.location.coordinate.latitude, business.location.coordinate.longitude],
				:latitude => business.location.coordinate.latitude,
				:longitude => business.location.coordinate.longitude,
				:address => business.location.address,
				:name => business.name
				# :category => business.categories[0][0]
			}

		end
		
		nearby_businesses
	end


end


