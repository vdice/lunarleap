class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.text :body
      t.integer :challenge_id

      t.timestamps null: false
    end
  end
end
