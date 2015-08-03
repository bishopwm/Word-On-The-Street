class StreetwordsController < ApplicationController
	def index
		@user = current_user
		@streetwords = @user.streetwords
		@streetword = @user.streetwords.new
	end

	def create
		# fail
		@streetword = current_user.streetwords.new(street_word_params)
		if @streetword.valid?
			@streetword.save
			redirect_to streetwords_path(current_user), notice: "Post was successfull!"
		else
			redirect_to '/'
		end
	end

	def destroy
		@user = current_user
		@streetword = Streetword.find_by(id: params[:id]).try(:destroy)
	end


	private

  	def street_word_params
    	params.require(:streetword).permit(:name, :latitude, :longitude, :address)
  	end

end
