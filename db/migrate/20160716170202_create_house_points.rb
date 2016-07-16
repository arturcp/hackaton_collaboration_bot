class CreateHousePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :house_points do |t|
      t.integer :house_id
      t.integer :points
      t.string :user
      t.timestamps null: false
    end
  end
end
