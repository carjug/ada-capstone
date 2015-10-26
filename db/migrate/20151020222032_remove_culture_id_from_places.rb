class RemoveCultureIdFromPlaces < ActiveRecord::Migration
  def change
    remove_column :places, :culture_id, :integer
  end
end
