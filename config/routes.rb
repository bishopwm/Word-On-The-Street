Rails.application.routes.draw do
  devise_for :users

  get '/' => 'sites#home'
  get '/map' => 'yelp_results#add_search_to_map'

 
end
