class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.integer :city_id

      t.timestamps null: false
    end

    create_join_table :places, :categories
  end
end
