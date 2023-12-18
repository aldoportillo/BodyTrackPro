class RemoveFatFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :fat, :integer
  end
end
