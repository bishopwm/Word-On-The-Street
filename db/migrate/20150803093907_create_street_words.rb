class CreateStreetWords < ActiveRecord::Migration
  def change
    create_table :street_words do |t|
    	t.integer :user_id
    	t.string :name
    	t.string :latitude
    	t.string :longitude
    	t.string :address
      t.timestamps null: false
    end
  end
end
