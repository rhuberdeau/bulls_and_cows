class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :bulls
      t.integer :cows
      t.integer :guess_id

      t.timestamps
    end
  end
end
