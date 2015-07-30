

class MeetupSearcher

	def get_meetup_results(coordinates)

	  @meetup_events = []	

	  account_key = '65de4018521164813321f8656cf'
	  latitude = coordinates[:latitude]
	  longitude = coordinates[:longitude]
		responses = HTTParty.get("https://api.meetup.com/2/open_events?key=#{account_key}&lat=#{latitude}&lon=#{longitude}")

		responses["results"].each do |result|
			next if result['venue'].nil?
		  @meetup_events << {
		  	'event' => result['name'],
		  	'address' => result['venue']['address_1'],
		  	'coordinates' => [result['venue']['lat'], result['venue']['lon']]
		  }
		end

		@meetup_events

	end
	

end
