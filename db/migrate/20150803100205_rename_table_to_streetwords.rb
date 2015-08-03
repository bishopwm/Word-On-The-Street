class RenameTableToStreetwords < ActiveRecord::Migration
	  def self.up
	    rename_table :street_words, :streetwords
	  end 
	  def self.down
	    rename_table :streetwords, :street_words
	  end
end

