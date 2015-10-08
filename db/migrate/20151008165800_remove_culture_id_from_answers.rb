class RemoveCultureIdFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :culture_id, :integer
  end
end
