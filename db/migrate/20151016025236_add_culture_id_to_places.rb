class AddCultureIdToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :culture_id, :integer
  end
end
