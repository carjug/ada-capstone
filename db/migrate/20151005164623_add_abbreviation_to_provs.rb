class AddAbbreviationToProvs < ActiveRecord::Migration
  def change
    add_column :provs, :abbreviation, :string
  end
end
