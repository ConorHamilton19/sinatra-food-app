class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name 
      t.string :ingredients
      t.integer :restaurant_id
    end 
  end
end
