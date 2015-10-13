class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :axes, :place_types do |t|

    end
  end
end
