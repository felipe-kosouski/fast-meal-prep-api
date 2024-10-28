class CreateMealSuggestions < ActiveRecord::Migration[7.2]
  def change
    create_table :meal_suggestions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :meal_name
      t.text :ingredients
      t.integer :portion_size

      t.timestamps
    end
  end
end
