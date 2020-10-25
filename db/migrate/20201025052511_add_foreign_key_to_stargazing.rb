class AddForeignKeyToStargazing < ActiveRecord::Migration[6.0]
  def change
    add_column :stargazings, :user_id, :integer
  end
end
