class CreateTargetMacros < ActiveRecord::Migration[7.1]
  def change
    create_table :target_macros do |t|
      t.float :carb
      t.float :fat
      t.float :protein
      t.float :calories
      t.integer :user_id

      t.timestamps
    end
  end
end
