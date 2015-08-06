class StreetwordsController < ApplicationController

	def index
		@user = current_user
		@streetword = Streetword.find_by(id: params[:id])
		@streetwords = @user.streetwords

	end

	def create
		@streetword = current_user.streetwords.new(street_word_params)
		if @streetword.valid?
			@streetword.save
			redirect_to streetwords_path, notice: "Post was successfull!"
		else
			redirect_to '/'
		end
	end

	def destroy
		@user = current_user
		@streetword = Streetword.find_by(id: params[:id]).try(:destroy)
		redirect_to '/streetwords'
	end

	def add_community_to_map
		@latitude = params[:latitude]
    	@longitude = params[:longitude]
	end


	private

  	def street_word_params
    	params.require(:streetword).permit(:name, :latitude, :longitude, :address, :distance, :who, :url, :distance, :rating, :search_term)
  	end

end



