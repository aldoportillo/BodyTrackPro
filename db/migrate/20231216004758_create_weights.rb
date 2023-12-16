class CreateWeights < ActiveRecord::Migration[7.1]
  def change
    create_table :weights do |t|
      t.integer :pounds
      t.integer :user_id

      t.timestamps
    end
  end
end
