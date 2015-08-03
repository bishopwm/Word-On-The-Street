class InstaSearcher

# 	attr_accessor :insta_client

# 	enable :sessions



# 	CALLBACK_URL = "https://api.instagram.com/oauth/authorize/?client_id=CLIENT-ID&redirect_uri=REDIRECT-URI&response_type=code"

# 	@insta_client = Instagram.configure do |config|
# 	  config.client_id = ENV["instagram_client_id"]
# 	  config.client_secret = ENV["instagram_client_secret"]
# 	end
	
# 	get "/" do
# 	  '<a href="/oauth/connect">Connect with Instagram</a>'2
# 	end

# 	get "/oauth/connect" do
# 	  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
# 	end

# 	get "/oauth/callback" do
# 	  response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
# 	  session[:access_token] = response.access_token
# 	  redirect "/nav"
# 	end

# 	def get_insta_results(parameters, latitude, longitude)
# 		get "/media_search" do
# 		  client = Instagram.client(:access_token => session[:access_token])
# 		  html = "<h1>Get a list of media close to a given latitude and longitude</h1>"
# 		  for media_item in client.media_search(latitude,longitude)
# 		    html << "<img src='#{media_item.images.thumbnail.url}'>"
# 		  end
# 		  html

# 		get "/tags" do
# 		  client = Instagram.client(:access_token => session[:access_token])
# 		  html = "<h1>Search for tags, get tag info and get media by tag</h1>"
# 		  tags = client.tag_search(parameters)
# 		  html << "<h2>Tag Name = #{tags[0].name}. Media Count =  #{tags[0].media_count}. </h2><br/><br/>"
# 		  for media_item in client.tag_recent_media(tags[0].name)
# 		    html << "<img src='#{media_item.images.thumbnail.url}'>"
# 		  end
# 		  html
# 		end
# 	end
end