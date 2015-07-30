require 'net/http'

class MeetupSearcher

	def get_meetup_results(coordinates)

	  @meetup_events = []	

	  account_key = '65de4018521164813321f8656cf'
	  latitude = coordinates[:latitude]
	  longitude = coordinates[:longitude]
		responses = HTTParty.get("https://api.meetup.com/2/open_events?key=#{account_key}&lat=#{latitude}&lon=#{longitude}")

		responses.each do |response|
		  @meetup_events << {
		  	'event' => responses['results'][1]['name'],
		  	'address' => responses['results'][1]['venue']['address_1'],
		  	'coordinates' => [responses['results'][1]['venue']['lat'], responses['results'][1]['venue']['lon']]
		  }
		end
		@meetup_events

	end
	

end
