class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :title, null: false
      t.integer :trip_id, null: false
      t.integer :price, null: false
      t.integer :capacity_id, null: false
      t.date :first_day, null: false
      t.date :final_day, null: false
      t.date :deadline, null: false
      t.text :message, null: false
      t.references :user,null: false, foreign_key: true

      t.timestamps
    end
  end
end
