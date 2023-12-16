class CreateMusclePercentages < ActiveRecord::Migration[7.1]
  def change
    create_table :muscle_percentages do |t|
      t.integer :percent
      t.integer :user_id

      t.timestamps
    end
  end
end
