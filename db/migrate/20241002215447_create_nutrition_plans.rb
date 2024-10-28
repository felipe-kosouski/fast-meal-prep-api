class CreateNutritionPlans < ActiveRecord::Migration[7.2]
  def change
    create_table :nutrition_plans do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :protein
      t.integer :carbs
      t.integer :fats
      t.string :restrictions, array: true, default: []
      t.string :dislikes, array: true, default: []

      t.timestamps
    end
  end
end
