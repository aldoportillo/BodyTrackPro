class CreateFatPercentages < ActiveRecord::Migration[7.1]
  def change
    create_table :fat_percentages do |t|
      t.integer :percent
      t.integer :user_id

      t.timestamps
    end
  end
end
