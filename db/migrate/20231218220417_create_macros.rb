class CreateMacros < ActiveRecord::Migration[7.1]
  def change
    create_table :macros do |t|
      t.float :fat
      t.float :protein
      t.float :carb
      t.float :calories
      t.float :sugar
      t.float :added_sugar
      t.integer :user_id

      t.timestamps
    end
  end
end
