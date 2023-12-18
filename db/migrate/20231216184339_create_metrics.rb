class CreateMetrics < ActiveRecord::Migration[7.1]
  def change
    create_table :metrics do |t|
      t.float :weight
      t.float :fat_percentage
      t.float :muscle_percentage
      t.integer :user_id

      t.timestamps
    end
  end
end
