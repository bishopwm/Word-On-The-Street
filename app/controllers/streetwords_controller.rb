class StreetwordsController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@streetwords = @user.streetwords
		@streetword = @user.streetword.new
	end

	def create
		@user = User.find(params[:user_id])
		@streetword = @user.streetword.new(streetword_params)
		if @streetword.valid?
			@streetword.save
			redirect_to street_words_path(@user), notice: "Post was successfull!"
		else
			redirect_to '/'
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@streetword = Streetword.find_by(id: params[:id]).try(:destroy)
	end


	private

  	def street_word_params
    	params.require(:streetword).permit(:user_id, :name, :latitude, :longitude, :address)
  	end

end
