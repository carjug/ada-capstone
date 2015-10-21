class RemoveCultureIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :culture_id, :integer
  end
end
