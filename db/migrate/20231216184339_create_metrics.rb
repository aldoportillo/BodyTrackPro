class CreateMetrics < ActiveRecord::Migration[7.1]
  def change
    create_table :metrics do |t|
      t.integer :weight
      t.integer :fat_percentage
      t.integer :muscle_percentage
      t.integer :user_id

      t.timestamps
    end
  end
end
