class CreateCategoriesChallenges < ActiveRecord::Migration
  def change
    create_table :categories_challenges do |t|
      t.integer :category_id
      t.integer :challenge_id
    end
  end
end
