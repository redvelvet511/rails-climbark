class AddLatitudeAndLongitudeToAreas < ActiveRecord::Migration[7.0]
  def change
    add_column :areas, :latitude, :float
    add_column :areas, :longitude, :float
  end
end
