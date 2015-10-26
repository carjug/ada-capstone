class AddLatLongToCities < ActiveRecord::Migration
  def change
    add_column :cities, :lat_long, :string
  end
end
