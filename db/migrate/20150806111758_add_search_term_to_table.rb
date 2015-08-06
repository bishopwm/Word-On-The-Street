class AddSearchTermToTable < ActiveRecord::Migration
  def change
  	add_column :streetwords, :search_term, :string 
  end
end
