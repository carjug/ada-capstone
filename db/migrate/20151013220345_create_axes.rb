class CreateAxes < ActiveRecord::Migration
  def change
    create_table :axes do |t|
      t.string :axis

      t.timestamps null: false
    end
  end
end
