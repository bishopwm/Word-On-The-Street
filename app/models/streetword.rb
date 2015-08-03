class Streetword < ActiveRecord::Base
	belongs_to :user

	validates :user_id, presence: true
	validates :name, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
	validates :address, presence: true

	def self.last_created(n)
		order('user_id ASC')
	end

	def add_community_to_map



		
	end
end
