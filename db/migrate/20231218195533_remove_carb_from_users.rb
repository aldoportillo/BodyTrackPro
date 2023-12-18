class RemoveCarbFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :carb, :integer
  end
end
