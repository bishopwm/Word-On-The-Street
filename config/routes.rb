Rails.application.routes.draw do
  devise_for :users

  get '/' => 'sites#home'
  get '/map' => 'yelp_results#search'
 
end
