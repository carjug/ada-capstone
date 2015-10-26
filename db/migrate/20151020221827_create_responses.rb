class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :response
      t.integer :question_id
      t.integer :user_id
      t.integer :place_id

      t.timestamps null: false
    end
  end
end
