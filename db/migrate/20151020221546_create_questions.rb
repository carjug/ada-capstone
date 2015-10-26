class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :option5
      t.integer :place_type_id
      t.string :cat_or_ord

      t.timestamps null: false
    end
  end
end
